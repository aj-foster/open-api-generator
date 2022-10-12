defmodule OpenAPI.Spec.Schema.Media do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          schema: Spec.Ref.t() | Spec.Schema.t(),
          example: any,
          examples: %{optional(String.t()) => Spec.Schema.Example.t() | Spec.Ref.t()},
          encoding: %{optional(String.t()) => Spec.Schema.Encoding.t()}
        }

  defstruct [
    :schema,
    :example,
    :examples,
    :encoding
  ]

  @decoders %{
    schema: [Spec.Ref, Spec.Schema],
    example: :any,
    examples: nil,
    encoding: %{:string => Spec.Schema.Encoding}
  }
end
