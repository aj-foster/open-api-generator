defmodule OpenAPI.Spec.ExternalDocumentation do
  @moduledoc "Raw external documentation definition from the OpenAPI spec"

  #
  # Definition
  #

  @type t :: %__MODULE__{
          description: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :description,
    :url
  ]

  #
  # Decoder
  #

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    external_doc = %__MODULE__{
      url: Map.fetch!(yaml, "url"),
      description: Map.get(yaml, "description")
    }

    {state, external_doc}
  end
end
