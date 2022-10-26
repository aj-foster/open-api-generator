defmodule OpenAPI.Spec.Schema.XML do
  @moduledoc false

  #
  # Definition
  #

  @type t :: %__MODULE__{
          name: String.t() | nil,
          namespace: String.t() | nil,
          prefix: String.t() | nil,
          attribute: boolean | nil,
          wrapped: boolean | nil
        }

  defstruct [
    :name,
    :namespace,
    :prefix,
    :attribute,
    :wrapped
  ]

  #
  # Decoder
  #

  @spec decode(map, map, map) :: {map, t}
  def decode(state, _spec, yaml) do
    xml = %__MODULE__{
      name: Map.get(yaml, "name"),
      namespace: Map.get(yaml, "namespace"),
      prefix: Map.get(yaml, "prefix"),
      attribute: Map.get(yaml, "attribute"),
      wrapped: Map.get(yaml, "wrapped")
    }

    {state, xml}
  end
end
