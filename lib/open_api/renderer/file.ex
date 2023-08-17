defmodule OpenAPI.Renderer.File do
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema

  @type t :: %__MODULE__{
          ast: Macro.t() | nil,
          location: String.t() | nil,
          module: module,
          operations: [Operation.t()],
          schemas: [Schema.t()],
          using: [module]
        }

  defstruct [
    :ast,
    :location,
    :module,
    :operations,
    :schemas,
    :using
  ]

  def new(module, %Operation{} = operation) do
    %__MODULE__{
      module: module,
      operations: [operation],
      schemas: [],
      using: []
    }
  end

  def new(module, %Schema{} = schema) do
    %__MODULE__{
      module: module,
      operations: [],
      schemas: [schema],
      using: []
    }
  end

  def add(%__MODULE__{operations: operations} = file, %Operation{} = operation) do
    %__MODULE__{file | operations: [operation | operations]}
  end

  def add(%__MODULE__{schemas: schemas} = file, %Schema{} = schema) do
    %__MODULE__{file | schemas: [schema | schemas]}
  end
end
