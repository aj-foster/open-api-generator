defmodule OpenAPI.Generator do
  alias OpenAPI.Generator.Field
  alias OpenAPI.Generator.Operation
  alias OpenAPI.Generator.Render
  alias OpenAPI.Generator.Schema
  alias OpenAPI.State
  alias OpenAPI.Util

  @spec run(State.t()) :: :ok
  def run(state) do
    state
    |> process_operations()
    |> collect_operation_files()
    |> process_schemas()
    |> reconcile_files()
    |> write()
  end

  #
  # Operations
  #

  @methods [:get, :put, :post, :delete, :options, :head, :patch, :trace]

  @spec process_operations(State.t()) :: State.t()
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

        file = %{docstring: "", fields: %{}, name: filename, operations: [operation]}

        Map.update(acc, operation.module, file, fn existing_file ->
          %{existing_file | operations: [operation | existing_file.operations]}
        end)
      end)

    %State{state | operation_files: operations}
  end

  #
  # Schemas
  #

  @spec process_schemas(State.t()) :: State.t()
  defp process_schemas(%State{options: %{merge: merge_options}} = state) do
    schemas =
      for {schema_name, schema} <- state.schemas, into: %{} do
        {schema_name, Schema.process(state, schema)}
      end

    schemas =
      Enum.reduce(merge_options, schemas, fn {before_merge, after_merge}, schemas ->
        schema_to_be_merged =
          Map.get(schemas, before_merge) ||
            raise "Attempted to merge unknown schema #{before_merge}"

        schema_to_receive_merge =
          Map.get(schemas, after_merge) ||
            raise "Attempted to merge into unknown schema #{after_merge}"

        new_fields =
          Map.merge(schema_to_be_merged.fields, schema_to_receive_merge.fields, fn field_name,
                                                                                   field1,
                                                                                   field2 ->
            type =
              if field1.type != field2.type do
                {:union, [field1.type, field2.type]}
              else
                field2.type
              end

            %Field{
              required: field1.required and field2.required,
              name: field_name,
              nullable: field1.nullable or field2.nullable,
              type: type
            }
          end)

        combined_schema = Map.put(schema_to_receive_merge, :fields, new_fields)

        schemas
        |> Map.delete(before_merge)
        |> Map.put(after_merge, combined_schema)
      end)

    files =
      Enum.map(schemas, fn {name, schema} ->
        %{fields: fields} = schema
        module = Util.processed_name(state, name)

        filename =
          Path.join([
            state.options.base_location,
            state.options.schema_location,
            Macro.underscore(module) <> ".ex"
          ])

        module = Module.concat(state.options.base_module, module)

        {module, %{name: filename, docstring: "", fields: fields, operations: []}}
      end)
      |> Enum.into(%{})

    %State{state | schema_files: files}
  end

  #
  # Write
  #

  @spec reconcile_files(State.t()) :: State.t()
  defp reconcile_files(state) do
    files =
      Map.merge(state.schema_files, state.operation_files, fn _module,
                                                              schema_file,
                                                              operation_file ->
        Map.merge(schema_file, operation_file)
      end)

    %{state | files: files}
  end

  @spec write(State.t()) :: :ok
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
