defmodule SpaceTraders.System do
  @moduledoc """
  Provides struct and type for a System
  """

  @type t :: %__MODULE__{
          constellation: String.t() | nil,
          factions: [SpaceTraders.SystemFaction.t()],
          name: String.t() | nil,
          sectorSymbol: String.t(),
          symbol: String.t(),
          type: String.t(),
          waypoints: [SpaceTraders.SystemWaypoint.t()],
          x: integer,
          y: integer
        }

  defstruct [:constellation, :factions, :name, :sectorSymbol, :symbol, :type, :waypoints, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      constellation: :string,
      factions: [{SpaceTraders.SystemFaction, :t}],
      name: :string,
      sectorSymbol: :string,
      symbol: :string,
      type:
        {:enum,
         [
           "NEUTRON_STAR",
           "RED_STAR",
           "ORANGE_STAR",
           "BLUE_STAR",
           "YOUNG_STAR",
           "WHITE_DWARF",
           "BLACK_HOLE",
           "HYPERGIANT",
           "NEBULA",
           "UNSTABLE"
         ]},
      waypoints: [{SpaceTraders.SystemWaypoint, :t}],
      x: :integer,
      y: :integer
    ]
  end
end
