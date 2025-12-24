defmodule SpaceTraders.ScannedWaypoint do
  @moduledoc """
  Provides struct and type for a ScannedWaypoint
  """

  @type t :: %__MODULE__{
          chart: SpaceTraders.Chart.t() | nil,
          faction: SpaceTraders.WaypointFaction.t() | nil,
          orbitals: [SpaceTraders.WaypointOrbital.t()],
          symbol: String.t(),
          systemSymbol: String.t(),
          traits: [SpaceTraders.WaypointTrait.t()],
          type: String.t(),
          x: integer,
          y: integer
        }

  defstruct [:chart, :faction, :orbitals, :symbol, :systemSymbol, :traits, :type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chart: {SpaceTraders.Chart, :t},
      faction: {SpaceTraders.WaypointFaction, :t},
      orbitals: [{SpaceTraders.WaypointOrbital, :t}],
      symbol: :string,
      systemSymbol: :string,
      traits: [{SpaceTraders.WaypointTrait, :t}],
      type:
        {:enum,
         [
           "PLANET",
           "GAS_GIANT",
           "MOON",
           "ORBITAL_STATION",
           "JUMP_GATE",
           "ASTEROID_FIELD",
           "ASTEROID",
           "ENGINEERED_ASTEROID",
           "ASTEROID_BASE",
           "NEBULA",
           "DEBRIS_FIELD",
           "GRAVITY_WELL",
           "ARTIFICIAL_GRAVITY_WELL",
           "FUEL_STATION"
         ]},
      x: :integer,
      y: :integer
    ]
  end
end
