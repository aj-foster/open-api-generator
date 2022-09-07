defmodule OpenAPI.Spec.Schema.Discriminator do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          property_name: String.t(),
          mapping: %{optional(String.t()) => String.t()}
        }

  defstruct [
    :property_name,
    :mapping
  ]

  @decoders %{
    property_name: :string,
    mapping: %{:string => :string}
  }
end
