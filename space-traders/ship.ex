defmodule SpaceTraders.Ship do
  @moduledoc """
  Provides struct and type for a Ship
  """

  @type t :: %__MODULE__{
          cargo: SpaceTraders.ShipCargo.t(),
          cooldown: SpaceTraders.Cooldown.t(),
          crew: SpaceTraders.ShipCrew.t(),
          engine: SpaceTraders.ShipEngine.t(),
          frame: SpaceTraders.ShipFrame.t(),
          fuel: SpaceTraders.ShipFuel.t(),
          modules: [SpaceTraders.ShipModule.t()],
          mounts: [SpaceTraders.ShipMount.t()],
          nav: SpaceTraders.ShipNav.t(),
          reactor: SpaceTraders.ShipReactor.t(),
          registration: SpaceTraders.ShipRegistration.t(),
          symbol: String.t()
        }

  defstruct [
    :cargo,
    :cooldown,
    :crew,
    :engine,
    :frame,
    :fuel,
    :modules,
    :mounts,
    :nav,
    :reactor,
    :registration,
    :symbol
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cargo: {SpaceTraders.ShipCargo, :t},
      cooldown: {SpaceTraders.Cooldown, :t},
      crew: {SpaceTraders.ShipCrew, :t},
      engine: {SpaceTraders.ShipEngine, :t},
      frame: {SpaceTraders.ShipFrame, :t},
      fuel: {SpaceTraders.ShipFuel, :t},
      modules: [{SpaceTraders.ShipModule, :t}],
      mounts: [{SpaceTraders.ShipMount, :t}],
      nav: {SpaceTraders.ShipNav, :t},
      reactor: {SpaceTraders.ShipReactor, :t},
      registration: {SpaceTraders.ShipRegistration, :t},
      symbol: :string
    ]
  end
end
