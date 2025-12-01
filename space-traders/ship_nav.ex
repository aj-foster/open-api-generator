defmodule SpaceTraders.ShipNav do
  @moduledoc """
  Provides struct and type for a ShipNav
  """

  @type t :: %__MODULE__{
          flightMode: String.t(),
          route: SpaceTraders.ShipNavRoute.t(),
          status: String.t(),
          systemSymbol: String.t(),
          waypointSymbol: String.t()
        }

  defstruct [:flightMode, :route, :status, :systemSymbol, :waypointSymbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flightMode: {:enum, ["DRIFT", "STEALTH", "CRUISE", "BURN"]},
      route: {SpaceTraders.ShipNavRoute, :t},
      status: {:enum, ["IN_TRANSIT", "IN_ORBIT", "DOCKED"]},
      systemSymbol: :string,
      waypointSymbol: :string
    ]
  end
end
