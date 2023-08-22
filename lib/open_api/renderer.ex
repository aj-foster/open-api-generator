defmodule OpenAPI.Renderer do
  @moduledoc """
  Phase three of code generation

  The **render** phase begins with operation and schema structs created during the **process**
  phase. It uses this data to construct and save files containing Elixir source code. Most of
  the work done by this phase involves the manipulation of Elixir ASTs.
  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State

  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(state) do
    %State{files: files_by_module} =
      state
      |> State.new()
      |> collect_files()
      |> render_files()

    %OpenAPI.State{state | files: Map.values(files_by_module)}
  end

  #
  # Integration
  #

  defmacro __using__(_opts) do
    quote do
      defdelegate format(state, file), to: OpenAPI.Renderer
      defdelegate location(state, file), to: OpenAPI.Renderer
      defdelegate render(state, file), to: OpenAPI.Renderer
      defdelegate render_default_client(state, file), to: OpenAPI.Renderer
      defdelegate render_moduledoc(state, file), to: OpenAPI.Renderer
      defdelegate render_operations(state, file), to: OpenAPI.Renderer
      defdelegate render_operation(state, operation), to: OpenAPI.Renderer
      defdelegate render_operation_doc(state, operation), to: OpenAPI.Renderer
      defdelegate render_operation_function(state, operation), to: OpenAPI.Renderer
      defdelegate render_operation_spec(state, operation), to: OpenAPI.Renderer
      defdelegate render_schema(state, file), to: OpenAPI.Renderer
      defdelegate render_schema_field_function(state, schemas), to: OpenAPI.Renderer
      defdelegate render_schema_struct(state, schemas), to: OpenAPI.Renderer
      defdelegate render_schema_types(state, schemas), to: OpenAPI.Renderer
      defdelegate render_using(state, file), to: OpenAPI.Renderer
      defdelegate write(state, file), to: OpenAPI.Renderer

      defoverridable format: 2,
                     location: 2,
                     render: 2,
                     render_default_client: 2,
                     render_moduledoc: 2,
                     render_operations: 2,
                     render_operation: 2,
                     render_operation_doc: 2,
                     render_operation_function: 2,
                     render_operation_spec: 2,
                     render_schema: 2,
                     render_schema_field_function: 2,
                     render_schema_struct: 2,
                     render_schema_types: 2,
                     render_using: 2,
                     write: 2
    end
  end

  #
  # Callbacks
  #

  @optional_callbacks format: 2,
                      location: 2,
                      render: 2,
                      render_default_client: 2,
                      render_moduledoc: 2,
                      render_operations: 2,
                      render_operation: 2,
                      render_operation_doc: 2,
                      render_operation_function: 2,
                      render_operation_spec: 2,
                      render_schema: 2,
                      render_schema_field_function: 2,
                      render_schema_struct: 2,
                      render_schema_types: 2,
                      render_using: 2,
                      write: 2

  @doc """
  Convert the Abstract Syntax Tree (AST) form of the file into formatted code
  """
  @callback format(State.t(), File.t()) :: iodata

  @doc """
  Choose the filesystem location for a rendered file to be written
  """
  @callback location(State.t(), File.t()) :: String.t()

  @doc """
  Create the contents of a file in quoted Abstract Syntax Tree (AST) form

  This is the primary function called to render a file. The default implementation calls several
  other callbacks (all named `render_*`) which can be overridden individually.
  """
  @callback render(State.t(), File.t()) :: Macro.t()

  @doc """
  Render the `@default_client` module attribute in an operation module
  """
  @callback render_default_client(State.t(), File.t()) :: Macro.t()

  @doc """
  Render the `@moduledoc` portion of the file
  """
  @callback render_moduledoc(State.t(), File.t()) :: Macro.t()

  @doc """
  Render the associated types, docstring, typespec, and function for all operations

  This is the primary function called to render all operations in a file. The default
  implementation calls several other callbacks (all named `render_operation*`) which can be
  overridden individually.
  """
  @callback render_operations(State.t(), File.t()) :: Macro.t()

  @doc """
  Render the associated types, docstring, typespec, and function for a single operation

  The default implementation of this function calls several other callbacks (all named
  `render_operation_*`) which can be overridden individually.
  """
  @callback render_operation(State.t(), Operation.t()) :: Macro.t()

  @doc """
  Render the `@doc` portion of an operation function
  """
  @callback render_operation_doc(State.t(), Operation.t()) :: Macro.t()

  @doc """
  Render the main function portion of an operation
  """
  @callback render_operation_function(State.t(), Operation.t()) :: Macro.t()

  @doc """
  Render the `@spec` portion of an operation function
  """
  @callback render_operation_spec(State.t(), Operation.t()) :: Macro.t()

  @doc """
  Render the types, struct, and field function for schemas not related to an operation

  This is the primary function called to render schemas. The default implementation calls several
  other callbacks (all named `render_schema_*`) which can be overridden individually.
  """
  @callback render_schema(State.t(), File.t()) :: Macro.t()

  @doc """
  Render a function `__fields__/1` that return a keyword list of schema fields and their types
  """
  @callback render_schema_field_function(State.t(), [Schema.t()]) :: Macro.t()

  @doc """
  Render the `defstruct` call for the schema types contained in the file
  """
  @callback render_schema_struct(State.t(), [Schema.t()]) :: Macro.t()

  @doc """
  Render the typespecs for schema types contained in the file
  """
  @callback render_schema_types(State.t(), [Schema.t()]) :: Macro.t()

  @doc """
  Render one or more `use` statements in the file, if necessary
  """
  @callback render_using(State.t(), File.t()) :: Macro.t()

  @doc """
  Write a rendered file to the filesystem
  """
  @callback write(State.t(), File.t()) :: :ok

  #
  # Default Implementations
  #

  defdelegate format(state, file), to: OpenAPI.Renderer.Util
  defdelegate location(state, file), to: OpenAPI.Renderer.Module, as: :filename
  defdelegate render(state, file), to: OpenAPI.Renderer.Module
  defdelegate render_default_client(state, file), to: OpenAPI.Renderer.Module
  defdelegate render_moduledoc(state, file), to: OpenAPI.Renderer.Module
  defdelegate render_operations(state, file), to: OpenAPI.Renderer.Operation, as: :render_all
  defdelegate render_operation(state, operation), to: OpenAPI.Renderer.Operation, as: :render

  defdelegate render_operation_doc(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_doc

  defdelegate render_operation_function(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_function

  defdelegate render_operation_spec(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_spec

  defdelegate render_schema(state, file), to: OpenAPI.Renderer.Schema, as: :render

  defdelegate render_schema_field_function(state, schemas),
    to: OpenAPI.Renderer.Schema,
    as: :render_field_function

  defdelegate render_schema_struct(state, schemas),
    to: OpenAPI.Renderer.Schema,
    as: :render_struct

  defdelegate render_schema_types(state, schemas), to: OpenAPI.Renderer.Schema, as: :render_types
  defdelegate render_using(state, file), to: OpenAPI.Renderer.Module
  defdelegate write(state, file), to: OpenAPI.Renderer.Util

  #
  # Helpers
  #

  @spec collect_files(State.t()) :: State.t()
  defp collect_files(state) do
    %State{operations: operations, schemas: schemas} = state

    for item <- operations ++ Map.values(schemas), reduce: state do
      state -> collect_file(state, item)
    end
  end

  @spec collect_file(State.t(), Operation.t()) :: State.t()
  @spec collect_file(State.t(), Schema.t()) :: State.t()
  defp collect_file(state, %Operation{module_name: module} = operation) do
    State.update_files(state, module, operation)
  end

  defp collect_file(state, %Schema{module_name: nil}) do
    state
  end

  defp collect_file(state, %Schema{module_name: module} = schema) do
    State.update_files(state, module, schema)
  end

  @spec render_files(State.t()) :: State.t()
  defp render_files(state) do
    %State{files: files_by_module, implementation: implementation} = state

    for {module, file} <- files_by_module, reduce: state do
      %State{files: files_by_module} = state ->
        file =
          file
          |> then(&%File{&1 | ast: implementation.render(state, &1)})
          |> then(&%File{&1 | contents: implementation.format(state, &1)})
          |> then(&%File{&1 | location: implementation.location(state, &1)})

        implementation.write(state, file)
        %State{state | files: Map.put(files_by_module, module, file)}
    end
  end
end
