defmodule OpenAPI.Renderer.Module do
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @doc """
  Choose a filename for the given file based on its module name and contents

  If the file does not contain any operations, the file name is chosen as the concatenation of:

  * The base `location` set in the `output` configuration
  * The `schema_subdirectory` set in the `output` configuration
  * The underscored module name (ex. `Some.Schema` becomes `some/schema.ex`)

  """
  @spec filename(State.t(), File.t()) :: String.t()
  def filename(state, file)

  def filename(state, %File{operations: []} = file) do
    %File{module: module} = file
    config = config(state)

    base_location = Keyword.get(config, :location, "")
    schema_subdirectory = Keyword.get(config, :schema_subdirectory, "")
    file_location = Macro.underscore(module) <> ".ex"

    Path.join([
      base_location,
      schema_subdirectory,
      file_location
    ])
  end

  def filename(state, file) do
    %File{module: module} = file
    config = config(state)

    base_location = Keyword.get(config, :location, "")
    operation_subdirectory = Keyword.get(config, :operation_subdirectory, "")
    file_location = Macro.underscore(module) <> ".ex"

    Path.join([
      base_location,
      operation_subdirectory,
      file_location
    ])
  end

  @spec render(State.t(), File.t()) :: Macro.t()
  def render(state, file) do
    %State{implementation: implementation} = state
    %File{module: file_module} = file

    module_name =
      Module.concat([
        config(state)[:base_module],
        file_module
      ])

    moduledoc = implementation.render_moduledoc(state, file)
    using = implementation.render_using(state, file)
    default_client = implementation.render_default_client(state, file)
    schema = implementation.render_schema(state, file)
    operations = implementation.render_operations(state, file)

    header =
      [moduledoc, using]
      |> Util.clean_list()
      |> Util.put_newlines()

    module_contents =
      [header, default_client, schema, operations]
      |> Util.clean_list()

    quote do
      defmodule unquote(module_name) do
        (unquote_splicing(module_contents))
      end
    end
  end

  @doc """
  Construct the `@moduledoc` portion of the file
  """
  @spec render_moduledoc(State.t(), File.t()) :: Macro.t()
  def render_moduledoc(state, file)

  def render_moduledoc(_state, %File{operations: []} = file) do
    %File{module: module, schemas: schemas} = file
    moduledoc = "Provides struct and #{plural(schemas, "type")} for a #{inspect(module)}\n"
    quote do: @moduledoc(unquote(moduledoc))
  end

  def render_moduledoc(_state, file) do
    %File{module: module, operations: operations} = file
    topic = Macro.underscore(module) |> String.replace("_", " ")
    moduledoc = "Provides API #{plural(operations, "endpoint")} related to #{topic}\n"
    quote do: @moduledoc(unquote(moduledoc))
  end

  @doc """
  Construct any `use` statements that should be included in the file
  """
  @spec render_using(State.t(), File.t()) :: Macro.t()
  def render_using(state, file) do
    %File{operations: operations, schemas: schemas} = file

    operation_use = config(state)[:operation_use]
    schema_use = config(state)[:schema_use]

    Util.clean_list([
      if length(operations) > 0 && operation_use do
        quote do: use(unquote(operation_use))
      end,
      if length(schemas) > 0 && schema_use do
        quote do: use(unquote(schema_use))
      end
    ])
  end

  @doc """
  Construct the `@default_client` module attribute for modules with operations
  """
  @spec render_default_client(State.t(), File.t()) :: Macro.t()
  def render_default_client(state, file)
  def render_default_client(_state, %File{operations: []}), do: []

  def render_default_client(state, _file) do
    config = config(state)
    fallback = Module.concat([Keyword.get(config, :base_module), Client])

    case Keyword.get(config, :default_client, :__undefined__) do
      disabled when disabled in [false, nil] ->
        []

      :__undefined__ ->
        quote do
          @default_client unquote(fallback)
        end
        |> Util.put_newlines()

      module ->
        quote do
          @default_client unquote(module)
        end
        |> Util.put_newlines()
    end
  end

  #
  # Helpers
  #

  @spec config(OpenAPI.Renderer.State.t()) :: Keyword.t()
  defp config(state) do
    %OpenAPI.Renderer.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:output, [])
  end

  @spec plural(list, String.t()) :: String.t()
  defp plural(list, word)
  defp plural(list, word) when length(list) == 1, do: word
  defp plural(_list, word), do: word <> "s"
end
