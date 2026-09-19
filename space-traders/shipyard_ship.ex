defmodule SpaceTraders.ShipyardShip do
  @moduledoc """
  Provides struct and type for a ShipyardShip
  """

  @type t :: %__MODULE__{
          activity: String.t() | nil,
          crew: SpaceTraders.ShipyardShipCrew.t(),
          description: String.t(),
          engine: SpaceTraders.ShipEngine.t(),
          frame: SpaceTraders.ShipFrame.t(),
          modules: [SpaceTraders.ShipModule.t()],
          mounts: [SpaceTraders.ShipMount.t()],
          name: String.t(),
          purchasePrice: integer,
          reactor: SpaceTraders.ShipReactor.t(),
          supply: String.t(),
          type: String.t()
        }

  defstruct [
    :activity,
    :crew,
    :description,
    :engine,
    :frame,
    :modules,
    :mounts,
    :name,
    :purchasePrice,
    :reactor,
    :supply,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      activity: {:enum, ["WEAK", "GROWING", "STRONG", "RESTRICTED"]},
      crew: {SpaceTraders.ShipyardShipCrew, :t},
      description: :string,
      engine: {SpaceTraders.ShipEngine, :t},
      frame: {SpaceTraders.ShipFrame, :t},
      modules: [{SpaceTraders.ShipModule, :t}],
      mounts: [{SpaceTraders.ShipMount, :t}],
      name: :string,
      purchasePrice: :integer,
      reactor: {SpaceTraders.ShipReactor, :t},
      supply: {:enum, ["SCARCE", "LIMITED", "MODERATE", "HIGH", "ABUNDANT"]},
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
