defmodule OpenAPI.Spec.Schema.Discriminator do
  @moduledoc false

  #
  # Definition
  #

  @type t :: %__MODULE__{
          property_name: String.t(),
          mapping: %{optional(String.t()) => String.t()}
        }

  defstruct [
    :property_name,
    :mapping
  ]

  #
  # Decoder
  #

  @spec decode(map, map, map) :: {map, t}
  def decode(state, _spec, yaml) do
    discriminator = %__MODULE__{
      property_name: Map.fetch!(yaml, "property_name"),
      mapping: Map.fetch!(yaml, "mapping")
    }

    {state, discriminator}
  end
end
