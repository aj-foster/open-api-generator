defmodule OpenAPI.Renderer.Module do
  @moduledoc """
  Default implementation for callbacks related to rendering operation and schema modules

  This module contains the default implementations for:

    * `c:OpenAPI.Renderer.location/2`
    * `c:OpenAPI.Renderer.render/2`
    * `c:OpenAPI.Renderer.render_default_client/2`
    * `c:OpenAPI.Renderer.render_moduledoc/2`
    * `c:OpenAPI.Renderer.render_using/2`

  These focus on portions of modules that may appear in both schema and operation modules.

  ## Configuration

  All configuration offered by the functions in this module lives under the `output` key of the
  active configuration profile. For example (default values shown):

      # config/config.exs

      config :oapi_generator, default: [
        output: [
          base_module: "",
          default_client: Client,
          location: "",
          operation_subdirectory: "",
          operation_use: "",
          schema_subdirectory: "",
          schema_use: "",
        ]
      ]
  """
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util

  @doc """
  Choose the filesystem location for the given file based on its module name and contents

  Default implementation of `c:OpenAPI.Renderer.render_location/2`.

  If the file does not contain any operations, the file name is chosen as the concatenation of:

  * The base `location` set in the `output` configuration,
  * The `schema_subdirectory` set in the `output` configuration, and
  * The underscored module name (ex. `Some.Schema` becomes `some/schema.ex`)

  ## Configuration

  Use `output.location` to set the directory of all outputted files (ex. `lib`). Then, optionally
  split operations and schemas into separate directories using `output.operation_subdirectory`
  and `output.schema_subdirectory`. This can be useful to show which modules are generated vs.
  those that are written by hand.

      config :oapi_generator, default: [
        output: [
          location: "lib",
          operation_subdirectory: "operations",
          schema_subdirectory: "schemas"
        ]
      ]

  With this configuration, an schema module named `My.ExampleSchema` would be output to
  `lib/operations/my/example_schema.ex`.
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

  @doc """
  Create the contents of a file in quoted Abstract Syntax Tree (AST) form

  Default implementation of `c:OpenAPI.Renderer.render/2`.

  This callback is the primary function called to render a file. It makes use of several other
  callbacks of the renderer (in this order), each of which my be overridden separately:

    * `c:OpenAPI.Renderer.render_moduledoc/2`
    * `c:OpenAPI.Renderer.render_using/2`
    * `c:OpenAPI.Renderer.render_default_client/2`
    * `c:OpenAPI.Renderer.render_schema/2`
    * `c:OpenAPI.Renderer.render_operations/2`

  Besides concatenating the results of these functions, this function also writes the `defmodule`
  call itself.

  ## Configuration

  Use `output.base_module` to determine a prefix to the name of all modules created by the
  generator. For example, given the following configuration:

      config :oapi_generator, default: [
        output: [
          base_module: MyClientLibrary
        ]
      ]

  A file with module name `MySchema` would be output as `MyClientLibrary.MySchema`. Usually, this
  configuration contains the name of your library's root module.
  """
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
  Construct the `@moduledoc` portion of the file based on the file contents

  Default implementation of `c:OpenAPI.Renderer.render_moduledoc/2`.

  This function provides a basic moduledoc for each file. If the file contains only schemas, then
  the moduledoc focuses on the structs and types it provides:

  > Provides struct and types for a MySchema

  If the file contains operations, it focuses on those:

  > Provides API endpoints related to MyOperations

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

  Default implementation of `c:OpenAPI.Renderer.render_using/2`.

  Another route for customization of the outputted code is via meta-programming. This callback
  enables library authors to `use` any module they like at the top of files that contain schemas,
  operations, or both. The referenced modules can then perform additional compile-time changes.

  ## Configuration

  Use `output.operation_use` to include a `use` statement at the top of each file that contains
  any operations, and `output.schema_use` to similarly include a `use` statement at the top of
  files containing a schema. Keep in mind that some files may contain both operations and a
  schema.

      config :oapi_generator, default: [
        output: [
          schema_use: MyLib.Schema
        ]
      ]

  This will result in a statement `use MyLib.Schema` (note that the `output.base_module`
  configuration is not used in this context).
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

  Default implementation of `c:OpenAPI.Renderer.render_default_client/2`.

  This allows callers to override the client implementation without having to pass the default
  module in as an argument. This callback renders the definition of the `@default_client` module
  attribute, effectively choosing which module will be called for every operation.

  ## Configuration

  Use `output.default_client` to choose which module is set. A value of `false` or `nil` will
  cause the module attribute not to be set at all, which may cause compilation errors if using
  the default implementation of the operation function renderer.

      config :oapi_generator, default: [
        output: [
          default_client: MyLib.MyClient
        ]
      ]

  This will result in a statement `@default_client MyLib.MyClient` to be added to any module that
  contains operations. Note that the `output.base_module` configuration is not used in this case.

  If the configuration is unset, then a default module of `[base module].Client` will be used,
  based on the `output.base_module` configuration.
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
