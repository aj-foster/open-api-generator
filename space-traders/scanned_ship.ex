defmodule SpaceTraders.ScannedShip do
  @moduledoc """
  Provides struct and type for a ScannedShip
  """

  @type t :: %__MODULE__{
          engine: SpaceTraders.ScannedShipEngine.t(),
          frame: SpaceTraders.ScannedShipFrame.t() | nil,
          mounts: [SpaceTraders.ScannedShipMounts.t()] | nil,
          nav: SpaceTraders.ShipNav.t(),
          reactor: SpaceTraders.ScannedShipReactor.t() | nil,
          registration: SpaceTraders.ShipRegistration.t(),
          symbol: String.t()
        }

  defstruct [:engine, :frame, :mounts, :nav, :reactor, :registration, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      engine: {SpaceTraders.ScannedShipEngine, :t},
      frame: {SpaceTraders.ScannedShipFrame, :t},
      mounts: [{SpaceTraders.ScannedShipMounts, :t}],
      nav: {SpaceTraders.ShipNav, :t},
      reactor: {SpaceTraders.ScannedShipReactor, :t},
      registration: {SpaceTraders.ShipRegistration, :t},
      symbol: :string
    ]
  end
end
