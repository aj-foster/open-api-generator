defmodule OpenAPI.Spec.Path.Header do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          description: String.t() | nil,
          required: boolean,
          deprecated: boolean,
          allow_empty_value: boolean,
          style: String.t(),
          explode: boolean,
          allow_reserved: boolean,
          schema: Spec.Schema.t() | Spec.Ref.t() | nil,
          example: any,
          examples: %{optional(String.t()) => Spec.Schema.Example.t() | Spec.Ref.t()},
          content: %{optional(String.t()) => Spec.Schema.Media.t()}
        }

  defstruct [
    :description,
    :required,
    :deprecated,
    :allow_empty_value,
    :style,
    :explode,
    :allow_reserved,
    :schema,
    :example,
    :examples,
    :content
  ]

  @decoders %{
    description: :string,
    required: {:boolean, default: false},
    deprecated: {:boolean, default: false},
    allow_empty_value: {:boolean, default: false},
    style:
      {["matrix", "label", "form", "simple", "spaceDelimited", "pipeDelimited", "deepObject"],
       default: "simple"},
    explode: {:boolean, default: false},
    allow_reserved: {:boolean, default: false},
    schema: [Spec.Ref, Spec.Schema],
    example: :any,
    examples: %{:string => [Spec.Ref, Spec.Schema.Example]},
    content: %{:string => Spec.Schema.Media}
  }
end
