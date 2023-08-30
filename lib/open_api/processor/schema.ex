defmodule OpenAPI.Processor.Schema do
  @moduledoc """
  Provides the Schema struct that is used by the renderer
  """

  @typedoc "Processed schema data used by the renderer"
  @type t :: %__MODULE__{
          context: tuple | nil,
          fields: [],
          module_name: module,
          type_name: atom
        }

  defstruct context: nil,
            fields: [],
            module_name: nil,
            type_name: :t
end
