defmodule SpaceTraders.ShipFrame do
  @moduledoc """
  Provides struct and type for a ShipFrame
  """

  @type t :: %__MODULE__{
          condition: number,
          description: String.t(),
          fuelCapacity: integer,
          integrity: number,
          moduleSlots: integer,
          mountingPoints: integer,
          name: String.t(),
          quality: number,
          requirements: SpaceTraders.ShipRequirements.t(),
          symbol: String.t()
        }

  defstruct [
    :condition,
    :description,
    :fuelCapacity,
    :integrity,
    :moduleSlots,
    :mountingPoints,
    :name,
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
      fuelCapacity: :integer,
      integrity: {:number, "double"},
      moduleSlots: :integer,
      mountingPoints: :integer,
      name: :string,
      quality: {:number, "integer"},
      requirements: {SpaceTraders.ShipRequirements, :t},
      symbol:
        {:enum,
         [
           "FRAME_PROBE",
           "FRAME_DRONE",
           "FRAME_INTERCEPTOR",
           "FRAME_RACER",
           "FRAME_FIGHTER",
           "FRAME_FRIGATE",
           "FRAME_SHUTTLE",
           "FRAME_EXPLORER",
           "FRAME_MINER",
           "FRAME_LIGHT_FREIGHTER",
           "FRAME_HEAVY_FREIGHTER",
           "FRAME_TRANSPORT",
           "FRAME_DESTROYER",
           "FRAME_CRUISER",
           "FRAME_CARRIER",
           "FRAME_BULK_FREIGHTER"
         ]}
    ]
  end
end
