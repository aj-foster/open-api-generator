defmodule OpenAPI.Spec.Ref do
  @moduledoc false

  @type t :: %__MODULE__{
          "$ref": String.t()
        }

  defstruct [
    :"$ref"
  ]

  @decoders %{
    "$ref": :string
  }

  def decoders, do: @decoders

  def matches?(value) do
    match?(%{"$ref" => _}, Enum.into(value, %{}))
  end
end
