defmodule OpenAPI.Generator do
  @moduledoc false

  alias OpenAPI.Config
  alias OpenAPI.Generator.Operation
  alias OpenAPI.Generator.Render
  alias OpenAPI.Generator.Schema
  alias OpenAPI.State

  @spec run(State.t()) :: :ok
  def run(state) do
    state
    |> collect_schema_files()
    |> process_operations()
    |> collect_operation_files()
    |> reconcile_files()
    |> write()
  end

  #
  # Schemas
  #

  @spec collect_schema_files(State.t()) :: State.t()
  defp collect_schema_files(%State{config: config} = state) do
    %Config{
      base_location: base_location,
      schema_location: schema_location,
      schema_use: schema_use
    } = config

    state = Schema.discover(state, state.spec.paths)

    files =
      state.schemas
      |> Map.values()
      |> Enum.reduce(%{}, fn schema, files ->
        %Schema{final_name: final_name} = schema = Schema.process(state, schema)

        filename =
          Path.join([
            base_location,
            schema_location,
            Macro.underscore(final_name) <> ".ex"
          ])

        using =
          if schema_use do
            [schema_use]
          else
            []
          end

        file = %{name: filename, operations: [], schemas: [schema], using: using}

        Map.update(files, final_name, file, fn existing_file ->
          %{
            existing_file
            | schemas: [schema | existing_file.schemas],
              using: existing_file.using ++ using
          }
        end)
      end)

    %State{state | schema_files: files}
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
        Operation.process(state, path, item.parameters, method, operation)
    end
  end

  @spec collect_operation_files(State.t()) :: State.t()
  defp collect_operation_files(%State{operations: operations, config: config} = state) do
    %Config{base_location: base_location, operation_location: operation_location} = config

    operations =
      operations
      |> List.flatten()
      |> Enum.reduce(%{}, fn operation, acc ->
        filename =
          Path.join([
            base_location,
            operation_location,
            Macro.underscore(operation.module) <> ".ex"
          ])

        file = %{name: filename, operations: [operation], schemas: [], using: []}

        Map.update(acc, operation.module, file, fn existing_file ->
          %{
            existing_file
            | operations: [operation | existing_file.operations],
              using: existing_file.using
          }
        end)
      end)

    %State{state | operation_files: operations}
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
        %{
          name: operation_file.name,
          operations: operation_file.operations,
          schemas: schema_file.schemas,
          using: operation_file.using ++ schema_file.using
        }
      end)

    %{state | files: files}
  end

  @spec write(State.t()) :: :ok
  defp write(%State{files: files, config: config}) do
    %Config{
      base_module: base_module,
      base_location: base_location,
      default_client: default_client,
      types: types
    } = config

    File.mkdir_p!(base_location)

    for {original_module, file} <- files do
      %{name: filename} = file
      module = Module.concat(base_module, original_module)

      contents =
        file
        |> Map.merge(%{
          default_client: default_client,
          original_module: original_module,
          module: module,
          types: types
        })
        |> Render.render()

      File.mkdir_p!(Path.dirname(filename))
      File.write!(filename, [contents, "\n"])
    end

    :ok
  end
end
