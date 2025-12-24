defmodule SpaceTraders.ShipyardShipTypes do
  @moduledoc """
  Provides struct and type for a ShipyardShipTypes
  """

  @type t :: %__MODULE__{type: String.t()}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      type:
        {:enum,
         [
           "SHIP_PROBE",
           "SHIP_MINING_DRONE",
           "SHIP_SIPHON_DRONE",
           "SHIP_INTERCEPTOR",
           "SHIP_LIGHT_HAULER",
           "SHIP_COMMAND_FRIGATE",
           "SHIP_EXPLORER",
           "SHIP_HEAVY_FREIGHTER",
           "SHIP_LIGHT_SHUTTLE",
           "SHIP_ORE_HOUND",
           "SHIP_REFINING_FREIGHTER",
           "SHIP_SURVEYOR",
           "SHIP_BULK_FREIGHTER"
         ]}
    ]
  end
end
