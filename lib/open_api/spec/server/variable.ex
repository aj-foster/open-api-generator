defmodule OpenAPI.Spec.Server.Variable do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          enum: [String.t()],
          default: String.t(),
          description: String.t() | nil
        }

  defstruct [
    :enum,
    :default,
    :description
  ]

  @decoders %{
    enum: [:string],
    default: :string,
    description: :string
  }
end
