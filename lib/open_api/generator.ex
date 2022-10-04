defmodule OpenAPI.Generator do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Generator.Operation
  alias OpenAPI.Generator.Render
  alias OpenAPI.Generator.Schema
  alias OpenAPI.Generator.State
  alias OpenAPI.Spec

  @typep pre_state :: %State{}
  @type state :: State.t()

  @spec run(Spec.t(), keyword) :: any
  def run(spec, opts) do
    %State{spec: spec}
    |> process_options(opts)
    |> collect_schemas(spec)
    |> process_schemas()
    |> collect_operations(spec)
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
  # Operations
  #

  @methods [:get, :put, :post, :delete, :options, :head, :patch, :trace]

  @spec collect_operations(pre_state, Spec.t()) :: pre_state
  defp collect_operations(state, spec) do
    operations =
      for {path, item} <- spec.paths,
          method <- @methods,
          not is_nil(Map.get(item, method)) do
        Operation.process(state, {path, method, Map.get(item, method)})
      end
      |> List.flatten()
      |> Enum.reduce(%{}, fn {module, file}, acc ->
        Map.update(acc, module, file, fn existing_file ->
          %{
            existing_file
            | fields: file.fields ++ existing_file.fields,
              name: file.name,
              operations: file.operations ++ existing_file.operations
          }
        end)
      end)

    %{state | operation_files: operations}
  end

  #
  # Write
  #

  # @spec reconcile_files(pre_state) :: state
  defp reconcile_files(state) do
    files =
      Map.merge(state.schema_files, state.operation_files, fn _module,
                                                              schema_file,
                                                              operation_file ->
        Map.merge(schema_file, operation_file)
      end)

    %{state | files: files}
  end

  defp write(state) do
    File.mkdir_p!(state.options.base_location)

    for {module, file} <- state.files do
      %{name: filename, docstring: docstring, fields: fields, operations: operations} = file

      operations = Enum.sort_by(operations, & &1.name)

      file =
        Render.schema(
          module: module,
          default_client: state.options.default_client,
          docstring: docstring,
          fields: fields,
          operations: operations
        )
        |> Code.format_string!()

      File.mkdir_p!(Path.dirname(filename))
      File.write!(filename, [file, "\n"])
    end

    :ok
  end
end
