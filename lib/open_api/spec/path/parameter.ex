defmodule OpenAPI.Spec.Path.Parameter do
  @moduledoc false

  @type t :: %__MODULE__{
          name: String.t(),
          in: String.t(),
          description: String.t() | nil,
          required: boolean,
          deprecated: boolean,
          allow_empty_value: boolean
        }

  defstruct [
    :name,
    :in,
    :description,
    :required,
    :deprecated,
    :allow_empty_value
  ]

  @decoders %{
    name: :string,
    in: ["query", "header", "path", "cookie"],
    description: :string,
    required: {:boolean, default: false},
    deprecated: {:boolean, default: false},
    allow_empty_value: {:boolean, default: false}
  }

  def decoders, do: @decoders

  def matches?(value) do
    match?(%{"name" => _, "in" => _}, Enum.into(value, %{}))
  end
end
