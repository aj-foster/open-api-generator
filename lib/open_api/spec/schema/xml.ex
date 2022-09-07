defmodule OpenAPI.Spec.Schema.XML do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          name: String.t() | nil,
          namespace: String.t() | nil,
          prefix: String.t() | nil,
          attribute: boolean | nil,
          wrapped: boolean | nil
        }

  defstruct [
    :name,
    :namespace,
    :prefix,
    :attribute,
    :wrapped
  ]

  @decoders %{
    name: :string,
    namespace: :string,
    prefix: :string,
    attribute: :boolean,
    wrapped: :boolean
  }
end
