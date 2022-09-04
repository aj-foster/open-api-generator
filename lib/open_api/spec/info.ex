defmodule OpenAPI.Spec.Info do
  @moduledoc false
  alias OpenAPI.Spec.Info

  @type t :: %__MODULE__{
          title: String.t(),
          description: String.t() | nil,
          terms_of_service: String.t() | nil,
          contact: Info.Contact.t() | nil,
          license: Info.License.t() | nil,
          version: String.t()
        }

  defstruct [
    :title,
    :description,
    :terms_of_service,
    :contact,
    :license,
    :version
  ]

  @decoders %{
    title: :string,
    description: :string,
    terms_of_service: :string,
    contact: Info.Contact,
    license: Info.License,
    version: :string
  }

  def decoders, do: @decoders
end
