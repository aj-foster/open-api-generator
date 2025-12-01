defmodule SpaceTraders.ShipReactor do
  @moduledoc """
  Provides struct and type for a ShipReactor
  """

  @type t :: %__MODULE__{
          condition: number,
          description: String.t(),
          integrity: number,
          name: String.t(),
          powerOutput: integer,
          quality: number,
          requirements: SpaceTraders.ShipRequirements.t(),
          symbol: String.t()
        }

  defstruct [
    :condition,
    :description,
    :integrity,
    :name,
    :powerOutput,
    :quality,
    :requirements,
    :symbol
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      condition: {:number, "double"},
      description: :string,
      integrity: {:number, "double"},
      name: :string,
      powerOutput: :integer,
      quality: {:number, "integer"},
      requirements: {SpaceTraders.ShipRequirements, :t},
      symbol:
        {:enum,
         [
           "REACTOR_SOLAR_I",
           "REACTOR_FUSION_I",
           "REACTOR_FISSION_I",
           "REACTOR_CHEMICAL_I",
           "REACTOR_ANTIMATTER_I"
         ]}
    ]
  end
end
