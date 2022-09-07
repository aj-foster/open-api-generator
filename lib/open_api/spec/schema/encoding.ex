defmodule OpenAPI.Spec.Schema.Encoding do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          content_type: String.t() | nil,
          headers: %{optional(String.t()) => Spec.Path.Header.t()},
          style: String.t(),
          explode: boolean,
          allow_reserved: boolean
        }

  defstruct [
    :content_type,
    :headers,
    :style,
    :explode,
    :allow_reserved
  ]

  @decoders %{
    content_type: :string,
    headers: %{:string => Spec.Path.Header},
    style: :string,
    explode: :boolean,
    allow_reserved: {:boolean, default: false}
  }
end
