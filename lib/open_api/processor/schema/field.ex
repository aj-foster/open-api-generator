defmodule OpenAPI.Processor.Schema.Field do
  @moduledoc """
  Provides the Field struct that is used by the renderer

  This struct is created by the Processor to hold only the data necessary for rendering fields
  and their types. It has the following fields:

    * `name`: Name of the field in its parent schema
    * `nullable`: Whether the field is defined as nullable
    * `private`: Whether the field was added via the `output.extra_fields` configuration
    * `required`: Whether the field is marked as required by its parent schema
    * `type`: Internal representation of the field's type

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
