defmodule OpenAPI.Spec.Server do
  @moduledoc false
  alias OpenAPI.Spec.Server

  @type t :: %__MODULE__{
          url: String.t(),
          description: String.t() | nil,
          variables: %{optional(String.t()) => nil}
        }

  defstruct [
    :url,
    :description,
    :variables
  ]

  @decoders %{
    url: :string,
    description: :string,
    variables: {[Server.Variable], default: []}
  }

  def decoders, do: @decoders
end
