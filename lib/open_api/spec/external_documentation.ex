defmodule OpenAPI.Spec.ExternalDocumentation do
  @moduledoc false

  @type t :: %__MODULE__{
          description: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :description,
    :url
  ]

  @decoders %{
    description: :string,
    url: :string
  }

  def decoders, do: @decoders
end
