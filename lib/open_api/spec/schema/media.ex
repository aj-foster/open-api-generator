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
    examples: %{:string => [Spec.Ref, Spec.Schema.Example]},
    encoding: %{:string => Spec.Schema.Encoding}
  }
end
