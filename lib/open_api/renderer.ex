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

  This callback can expect a `t:File.t/0` struct with the completed contents of the file included
  in the `ast` field. Nodes of the AST may include optional formatting metadata (ex. `delimiter`,
  `indentation`, or `end_of_expression`). It is recommended that the formatter adhere to the
  standard configuration of the default Mix formatter (for example, formatting to a line width
  of 98) in order to avoid a large amount of changes should someone run `mix format` on the
  generated code.

  The return value of the callback can be `iodata` (strings do not need to be concatenated), and
  it will be stored in the `contents` field of the file.

  See `OpenAPI.Renderer.Util.format/2` for the default implementation.
  """
  @callback format(state :: State.t(), file :: File.t()) :: iodata

  @doc """
  Choose the filesystem location for a rendered file to be written

  See `OpenAPI.Renderer.Module.filename/2` for the default implementation.
  """
  @callback location(state :: State.t(), file :: File.t()) :: String.t()

  @doc """
  Create the contents of a file in quoted Abstract Syntax Tree (AST) form

  This callback is the primary function called to render a file. The default implementation calls
  several other callbacks, each of which my be overridden separately:

    * `c:OpenAPI.Renderer.render_moduledoc/2`
    * `c:OpenAPI.Renderer.render_using/2`
    * `c:OpenAPI.Renderer.render_default_client/2`
    * `c:OpenAPI.Renderer.render_schema/2`
    * `c:OpenAPI.Renderer.render_operations/2`

  See `OpenAPI.Renderer.Module.render/2` for the default implementation.
  """
  @callback render(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Render the `@default_client` module attribute in an operation module

  When using the default operation function renderer, every operation function includes a line:

      client = opts[:client] || @default_client

  This allows callers to override the client implementation without having to pass the default
  module in as an argument. This callback renders the definition of the `@default_client` module
  attribute, effectively choosing which module will be called for every operation.

  See `OpenAPI.Renderer.Module.render_default_client/2` for the default implementation.
  """
  @callback render_default_client(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Render the `@moduledoc` portion of the file

  Users of a client library may lean on this documentation to find the operation or schema they
  need. While the default implementation presents a fairly basic line of documentation depending
  on whether the file contains operations or a schema, custom implementations of this callback
  could provide rich and helpful instructions to consumers.

  See `OpenAPI.Renderer.Module.render_moduledoc/2` for the default implementation.
  """
  @callback render_moduledoc(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Render the associated types, docstring, typespec, and function for all operations

  This is the primary function called to render all operations in a file. The default
  implementation calls several other callbacks (all named `render_operation*`) which can be
  overridden individually.

  See `OpenAPI.Renderer.Operation.render_all/2` for the default implementation.
  """
  @callback render_operations(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Render the associated types, docstring, typespec, and function for a single operation

  The default implementation of this function calls several other callbacks (all named
  `render_operation_*`) which can be overridden individually.

  See `OpenAPI.Renderer.Operation.render/2` for the default implementation.
  """
  @callback render_operation(state :: State.t(), operation :: Operation.t()) :: Macro.t()

  @doc """
  Render the `@doc` portion of an operation function

  See `OpenAPI.Renderer.Operation.render_doc/2` for the default implementation.
  """
  @callback render_operation_doc(state :: State.t(), operation :: Operation.t()) :: Macro.t()

  @doc """
  Render the main function portion of an operation

  See `OpenAPI.Renderer.Operation.render_function/2` for the default implementation.
  """
  @callback render_operation_function(state :: State.t(), operation :: Operation.t()) :: Macro.t()

  @doc """
  Render the `@spec` portion of an operation function

  See `OpenAPI.Renderer.Operation.render_spec/2` for the default implementation.
  """
  @callback render_operation_spec(state :: State.t(), operation :: Operation.t()) :: Macro.t()

  @doc """
  Render the types, struct, and field function for schemas not related to an operation

  This is the primary function called to render schemas. The default implementation calls several
  other callbacks (all named `render_schema_*`) which can be overridden individually.

  See `OpenAPI.Renderer.Schema.render/2` for the default implementation.
  """
  @callback render_schema(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Render a function `__fields__/1` that return a keyword list of schema fields and their types

  See `OpenAPI.Renderer.Schema.render_field_function/2` for the default implementation.
  """
  @callback render_schema_field_function(state :: State.t(), schemas :: [Schema.t()]) :: Macro.t()

  @doc """
  Render the `defstruct` call for the schema types contained in the file

  See `OpenAPI.Renderer.Schema.render_struct/2` for the default implementation.
  """
  @callback render_schema_struct(state :: State.t(), schemas :: [Schema.t()]) :: Macro.t()

  @doc """
  Render the typespecs for schema types contained in the file

  See `OpenAPI.Renderer.Schema.render_types/2` for the default implementation.
  """
  @callback render_schema_types(state :: State.t(), schemas :: [Schema.t()]) :: Macro.t()

  @doc """
  Render one or more `use` statements to include in the file

  Another route for customization of the outputted code is via meta-programming. This callback
  enables library authors to `use` any module they like at the top of files that contain schemas,
  operations, or both. The referenced modules can then perform additional compile-time changes.

  See `OpenAPI.Renderer.Module.render_using/2` for the default implementation.
  """
  @callback render_using(state :: State.t(), file :: File.t()) :: Macro.t()

  @doc """
  Write a rendered file to the filesystem

  This callback can expect to receive a `t:File.t/0` struct with formatted file contents expressed
  as `iodata` in the `contents` field. It should write the file to the filesystem at the
  appropriate location included in the `location` field. While the return value is irrelevant,
  a simple `:ok` will suffice.

  See `OpenAPI.Renderer.Util.write/2` for the default implementation.
  """
  @callback write(state :: State.t(), file :: File.t()) :: :ok

  #
  # Default Implementations
  #

  @doc false
  defdelegate format(state, file), to: OpenAPI.Renderer.Util

  @doc false
  defdelegate location(state, file), to: OpenAPI.Renderer.Module, as: :filename

  @doc false
  defdelegate render(state, file), to: OpenAPI.Renderer.Module

  @doc false
  defdelegate render_default_client(state, file), to: OpenAPI.Renderer.Module

  @doc false
  defdelegate render_moduledoc(state, file), to: OpenAPI.Renderer.Module

  @doc false
  defdelegate render_operations(state, file), to: OpenAPI.Renderer.Operation, as: :render_all

  @doc false
  defdelegate render_operation(state, operation), to: OpenAPI.Renderer.Operation, as: :render

  @doc false
  defdelegate render_operation_doc(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_doc

  @doc false
  defdelegate render_operation_function(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_function

  @doc false
  defdelegate render_operation_spec(state, operation),
    to: OpenAPI.Renderer.Operation,
    as: :render_spec

  @doc false
  defdelegate render_schema(state, file), to: OpenAPI.Renderer.Schema, as: :render

  @doc false
  defdelegate render_schema_field_function(state, schemas),
    to: OpenAPI.Renderer.Schema,
    as: :render_field_function

  @doc false
  defdelegate render_schema_struct(state, schemas),
    to: OpenAPI.Renderer.Schema,
    as: :render_struct

  @doc false
  defdelegate render_schema_types(state, schemas), to: OpenAPI.Renderer.Schema, as: :render_types

  @doc false
  defdelegate render_using(state, file), to: OpenAPI.Renderer.Module

  @doc false
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
