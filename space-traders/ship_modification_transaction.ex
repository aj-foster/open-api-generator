defmodule SpaceTraders.ShipModificationTransaction do
  @moduledoc """
  Provides struct and type for a ShipModificationTransaction
  """

  @type t :: %__MODULE__{
          shipSymbol: String.t(),
          timestamp: DateTime.t(),
          totalPrice: integer,
          tradeSymbol: String.t(),
          waypointSymbol: String.t()
        }

  defstruct [:shipSymbol, :timestamp, :totalPrice, :tradeSymbol, :waypointSymbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      shipSymbol: :string,
      timestamp: {:string, "date-time"},
      totalPrice: :integer,
      tradeSymbol: :string,
      waypointSymbol: :string
    ]
  end
end
