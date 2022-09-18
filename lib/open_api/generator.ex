defmodule OpenAPI.Generator do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Generator.Render
  alias OpenAPI.Generator.Schema
  alias OpenAPI.Generator.State
  alias OpenAPI.Spec

  @typep pre_state :: %State{}
  @type state :: State.t()

  @spec run(Spec.t(), keyword) :: any
  def run(spec, opts) do
    %State{}
    |> process_options(opts)
    |> collect_schemas(spec)
    |> process_schemas()
    |> collect_paths(spec)
    |> process_paths()
    |> reconcile_files()
    |> write()
  end

  #
  # Options
  #

  @spec process_options(pre_state, keyword) :: pre_state
  defp process_options(state, opts) do
    options = Options.new(opts)
    %{state | options: options}
  end

  #
  # Schemas
  #

  @spec collect_schemas(pre_state, Spec.t()) :: pre_state
  defp collect_schemas(state, spec) do
    schemas =
      Enum.map(spec.components.schemas, fn {name, schema} ->
        module = process_name(state, name)
        {name, {module, schema}}
      end)
      |> Enum.reject(fn {name, {module, _schema}} -> ignored?(state, name, module) end)
      |> Enum.into(%{})

    %{state | schemas: schemas}
  end

  @spec ignored?(pre_state, String.t(), module) :: boolean
  defp ignored?(%State{options: %{ignore: ignore}}, schema_name, schema_module) do
    Enum.any?(ignore, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      ^schema_module -> true
      _ -> false
    end)
  end

  @spec process_name(pre_state, String.t()) :: String.t()
  defp process_name(%State{options: %{group: group, replace: replace}}, schema_name) do
    schema_name
    |> String.replace("-", "_")
    |> Macro.camelize()
    |> replace(replace)
    |> group(group)
  end

  @spec replace(String.t(), [{Options.replace_pattern(), Options.replace_action()}]) :: String.t()
  defp replace(schema_name, replacements) do
    Enum.reduce(replacements, schema_name, fn {pattern, replacement}, name ->
      String.replace(name, pattern, replacement)
    end)
  end

  @spec group(String.t(), [module]) :: String.t()
  defp group(schema_name, groups) do
    Enum.reduce(groups, schema_name, fn group, name ->
      group = inspect(group)

      cond do
        name == group -> name
        String.starts_with?(name, "#{group}.") -> name
        String.starts_with?(name, group) -> String.replace_leading(name, group, "#{group}.")
        true -> name
      end
    end)
  end

  @spec process_schemas(pre_state) :: pre_state
  defp process_schemas(state) do
    files = Schema.process(state) |> Enum.into(%{})
    %{state | schema_files: files}
  end

  #
  # Paths
  #

  @spec collect_paths(pre_state, Spec.t()) :: pre_state
  defp collect_paths(state, _spec) do
    %{state | paths: []}
  end

  @spec process_paths(pre_state) :: pre_state()
  defp process_paths(state) do
    files = Enum.map(state.paths, & &1) |> Enum.into(%{})
    %{state | path_files: files}
  end

  #
  # Write
  #

  @spec reconcile_files(pre_state) :: state
  defp reconcile_files(state) do
    files =
      Map.merge(state.schema_files, state.path_files, fn _module, schema_file, path_file ->
        Map.merge(schema_file, path_file)
      end)

    %{state | files: files}
  end

  @spec write(state) :: :ok
  defp write(state) do
    File.mkdir_p!(state.options.base_location)

    for {module, file} <- state.files do
      %{name: filename, docstring: docstring, fields: fields} = file

      file =
        Render.schema(
          module: module,
          docstring: docstring,
          fields: fields
        )
        |> Code.format_string!()

      File.mkdir_p!(Path.dirname(filename))
      File.write!(filename, [file, "\n"])
    end
  end
end
