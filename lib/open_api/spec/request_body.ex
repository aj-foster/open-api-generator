defmodule OpenAPI.Spec.RequestBody do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          description: String.t() | nil,
          content: %{optional(String.t()) => Spec.Schema.Media.t()},
          required: boolean
        }

  defstruct [
    :description,
    :content,
    :required
  ]

  @decoders %{
    description: :string,
    content: {%{:string => Spec.Schema.Media}, default: %{}},
    required: {:boolean, default: false}
  }

  def matches?(_value), do: true
end
