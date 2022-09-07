defmodule OpenAPI.Spec.Info.License do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          name: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :name,
    :url
  ]

  @decoders %{
    name: :string,
    url: :string
  }
end
