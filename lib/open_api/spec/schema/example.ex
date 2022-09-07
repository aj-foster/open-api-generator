defmodule OpenAPI.Spec.Schema.Example do
  @moduledoc false
  use OpenAPI.Spec.Helper

  @type t :: %__MODULE__{
          summary: String.t() | nil,
          description: String.t() | nil,
          value: any,
          external_value: String.t() | nil
        }

  defstruct [
    :summary,
    :description,
    :value,
    :external_value
  ]

  @decoders %{
    summary: :string,
    description: :string,
    value: :any,
    external_value: :string
  }

  def matches?(value) do
    value = Enum.into(value, %{})
    match?(%{"value" => _}, value) or match?(%{"externalValue" => _}, value)
  end
end
