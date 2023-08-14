defmodule OpenAPI.Processor.Schema do
  @moduledoc """
  Default plugin for formatting schemas

  This module also provides the Schema struct that is used by the renderer.
  """

  @typedoc "Processed schema data used by the renderer"
  @type t :: %__MODULE__{
          fields: [],
          module_name: module,
          type_name: atom
        }

  defstruct fields: [],
            module_name: nil,
            type_name: :t
end
