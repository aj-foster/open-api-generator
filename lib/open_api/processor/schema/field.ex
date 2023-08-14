defmodule OpenAPI.Processor.Schema.Field do
  @moduledoc """
  Default plugin for formatting schema fields

  This module also provides the Field struct that is used by the renderer.
  """
  alias OpenAPI.Processor.Type

  @typedoc "Processed field data used by the renderer"
  @type t :: %__MODULE__{
          name: String.t(),
          nullable: boolean,
          private: boolean,
          required: boolean,
          type: Type.t()
        }

  defstruct name: nil,
            nullable: false,
            private: false,
            required: false,
            type: nil
end
