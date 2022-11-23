defmodule OpenAPI.Spec.Schema.Example do
  @moduledoc false

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

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    example = %__MODULE__{
      summary: Map.get(yaml, "summary"),
      description: Map.get(yaml, "description"),
      value: Map.get(yaml, "value"),
      external_value: Map.get(yaml, "externalValue")
    }

    {state, example}
  end
end
