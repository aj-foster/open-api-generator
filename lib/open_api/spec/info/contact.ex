defmodule OpenAPI.Spec.Info.Contact do
  @moduledoc false

  @type t :: %__MODULE__{
          name: String.t() | nil,
          url: String.t() | nil,
          email: String.t() | nil
        }

  defstruct [
    :name,
    :url,
    :email
  ]

  @decoders %{
    name: :string,
    url: :string,
    email: :string
  }

  def decoders, do: @decoders
end
