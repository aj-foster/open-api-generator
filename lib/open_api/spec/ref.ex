defmodule OpenAPI.Spec.Ref do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          "$ref": String.t()
        }

  defstruct [
    :"$ref"
  ]

  @decoders %{
    "$ref": :string
  }

  def matches?(value) do
    match?(%{"$ref" => _}, Enum.into(value, %{}))
  end
end
