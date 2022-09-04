defmodule OpenAPI.Spec.Tag do
  @moduledoc false
  alias OpenAPI.Spec

  @typedoc "Open API specification"
  @type t :: %__MODULE__{
          name: String.t(),
          description: String.t() | nil,
          external_docs: Spec.ExternalDocumentation.t() | nil
        }

  defstruct [
    :name,
    :description,
    :external_docs
  ]

  @decoders %{
    name: :string,
    description: :string,
    external_docs: Spec.ExternalDocumentation
  }

  def decoders, do: @decoders
end
