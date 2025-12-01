defmodule SpaceTraders.Shipyard do
  @moduledoc """
  Provides struct and type for a Shipyard
  """

  @type t :: %__MODULE__{
          modificationsFee: integer,
          shipTypes: [SpaceTraders.ShipyardShipTypes.t()],
          ships: [SpaceTraders.ShipyardShip.t()] | nil,
          symbol: String.t(),
          transactions: [SpaceTraders.ShipyardTransaction.t()] | nil
        }

  defstruct [:modificationsFee, :shipTypes, :ships, :symbol, :transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      modificationsFee: :integer,
      shipTypes: [{SpaceTraders.ShipyardShipTypes, :t}],
      ships: [{SpaceTraders.ShipyardShip, :t}],
      symbol: :string,
      transactions: [{SpaceTraders.ShipyardTransaction, :t}]
    ]
  end
end
