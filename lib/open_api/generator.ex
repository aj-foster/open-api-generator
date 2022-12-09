defmodule OpenAPI.Generator do
  alias OpenAPI.Generator.Options
  alias OpenAPI.Generator.Operation
  alias OpenAPI.Generator.Render
  alias OpenAPI.Generator.Schema
  alias OpenAPI.State

  @type state :: State.t()

  @spec run(State.t()) :: State.t()
  def run(state) do
    state
    |> process_operations()
    |> collect_operation_files()
    |> reconcile_files()
    |> write()
  end

  @methods [:get, :put, :post, :delete, :options, :head, :patch, :trace]

  defp process_operations(state) do
    for {path, item} <- state.spec.paths,
        method <- @methods,
        not is_nil(Map.get(item, method)),
        reduce: state do
      state ->
        operation = Map.get(item, method)
        Operation.process(state, path, method, operation)
    end
  end

  #
  # Schemas
  #

  # @spec collect_schemas(state, Spec.t()) :: state
  # defp collect_schemas(state, spec) do
  #   schemas =
  #     Enum.map(spec.components.schemas, fn {name, schema} ->
  #       module = process_name(state, name)
  #       {name, {module, schema}}
  #     end)
  #     |> Enum.reject(fn {name, {module, _schema}} -> ignored?(state, name, module) end)
  #     |> Enum.into(%{})

  #   %{state | schemas: schemas}
  # end

  @spec process_name(state, String.t()) :: String.t()
  defp process_name(%State{options: %{group: group, replace: replace}}, schema_name) do
    schema_name
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

  @spec ignored?(state, String.t(), module) :: boolean
  defp ignored?(%State{options: %{ignore: ignore}}, schema_name, schema_module) do
    Enum.any?(ignore, fn
      %Regex{} = regex -> Regex.match?(regex, schema_name)
      ^schema_name -> true
      ^schema_module -> true
      _ -> false
    end)
  end

  @spec process_schemas(state) :: state
  defp process_schemas(state) do
    files = Schema.process(state) |> Enum.into(%{})
    %{state | schema_files: files}
  end

  #
  # Operations
  #

  @spec collect_operation_files(State.t()) :: State.t()
  defp collect_operation_files(state) do
    operations =
      state.operations
      |> List.flatten()
      |> Enum.reduce(%{}, fn operation, acc ->
        filename =
          Path.join([
            state.options.base_location,
            state.options.operation_location,
            Macro.underscore(operation.module) <> ".ex"
          ])

        file = %{docstring: "", fields: [], name: filename, operations: [operation]}

        Map.update(acc, operation.module, file, fn existing_file ->
          %{existing_file | operations: [operation | existing_file.operations]}
        end)
      end)

    %State{state | operation_files: operations}
  end

  #
  # Write
  #

  # @spec reconcile_files(state) :: state
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
