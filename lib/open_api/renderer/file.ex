defmodule OpenAPI.Renderer.File do
  @moduledoc """
  Collection of operations and schemas that belong to the same file

  As rendering occurs for a particular file, this struct will collect all of the necessary data
  to continue the process. It has the following fields:

    * `ast`: Once rendered, the Abstract Syntax Tree (AST), or quoted form, of the file contents.
      This AST may include additional formatting-related metadata.
    * `contents`: Once formatted, the `iodata` form of the file contents. This is what will be
      used by the default implementation of the write callback.
    * `location`: Once determined, the filesystem location (path) where the file is intended to
      be written.
    * `module`: Name of the Elixir module contained in the file.
    * `operations`: List of `t:OpenAPI.Processor.Operation.t/0` contained in the file.
    * `schemas`: List of `t:OpenAPI.Processor.Schema.t/0` contained in the file.

  All of this state is managed by the code generator, so it is unlikely that callbacks would need
  to write to this struct directly.
  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema

  @typedoc """
  File contents

  See module documentation for additional information.
  """
  @type t :: %__MODULE__{
          ast: Macro.t() | nil,
          contents: iodata | nil,
          location: String.t() | nil,
          module: module,
          operations: [Operation.t()],
          schemas: [Schema.t()]
        }

  defstruct [
    :ast,
    :contents,
    :location,
    :module,
    :operations,
    :schemas
  ]

  @doc false
  @spec new(module, Operation.t()) :: t
  @spec new(module, Schema.t()) :: t
  def new(module, %Operation{} = operation) do
    %__MODULE__{
      module: module,
      operations: [operation],
      schemas: []
    }
  end

  def new(module, %Schema{} = schema) do
    %__MODULE__{
      module: module,
      operations: [],
      schemas: [schema]
    }
  end

  @doc false
  @spec add(t, Operation.t()) :: t
  @spec add(t, Schema.t()) :: t
  def add(%__MODULE__{operations: operations} = file, %Operation{} = operation) do
    %__MODULE__{file | operations: [operation | operations]}
  end

  def add(%__MODULE__{schemas: schemas} = file, %Schema{} = schema) do
    %__MODULE__{file | schemas: [schema | schemas]}
  end
end
