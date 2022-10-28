defmodule OpenAPI.Spec.Server.Variable do
  @moduledoc false

  #
  # Definition
  #

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

  #
  # Decoder
  #

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    variable = %__MODULE__{
      enum: Map.fetch!(yaml, "enum"),
      default: Map.fetch!(yaml, "default"),
      description: Map.get(yaml, "description")
    }

    {state, variable}
  end
end
