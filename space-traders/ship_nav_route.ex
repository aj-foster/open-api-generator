defmodule SpaceTraders.ShipNavRoute do
  @moduledoc """
  Provides struct and type for a ShipNavRoute
  """

  @type t :: %__MODULE__{
          arrival: DateTime.t(),
          departureTime: DateTime.t(),
          destination: SpaceTraders.ShipNavRouteWaypoint.t(),
          origin: SpaceTraders.ShipNavRouteWaypoint.t()
        }

  defstruct [:arrival, :departureTime, :destination, :origin]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      arrival: {:string, "date-time"},
      departureTime: {:string, "date-time"},
      destination: {SpaceTraders.ShipNavRouteWaypoint, :t},
      origin: {SpaceTraders.ShipNavRouteWaypoint, :t}
    ]
  end
end
