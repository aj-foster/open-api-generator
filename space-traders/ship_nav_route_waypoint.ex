defmodule SpaceTraders.ShipNavRouteWaypoint do
  @moduledoc """
  Provides struct and type for a ShipNavRouteWaypoint
  """

  @type t :: %__MODULE__{
          symbol: String.t(),
          systemSymbol: String.t(),
          type: String.t(),
          x: integer,
          y: integer
        }

  defstruct [:symbol, :systemSymbol, :type, :x, :y]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      symbol: :string,
      systemSymbol: :string,
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
