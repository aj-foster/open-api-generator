defmodule OpenAPI.Spec.Info.Contact do
  @moduledoc false

  #
  # Definition
  #

  @type t :: %__MODULE__{
          name: String.t() | nil,
          url: String.t() | nil,
          email: String.t() | nil
        }

  defstruct [
    :name,
    :url,
    :email
  ]

  #
  # Decoder
  #

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    contact = %__MODULE__{
      name: Map.get(yaml, "name"),
      url: Map.get(yaml, "url"),
      email: Map.get(yaml, "email")
    }

    {state, contact}
  end
end
