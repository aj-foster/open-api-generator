defmodule OpenAPI.Spec.Schema.Discriminator do
  @moduledoc "Raw schema discriminator from the OpenAPI spec"

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

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    discriminator = %__MODULE__{
      property_name: Map.fetch!(yaml, "propertyName"),
      mapping: Map.get(yaml, "mapping", %{})
    }

    {state, discriminator}
  end
end
