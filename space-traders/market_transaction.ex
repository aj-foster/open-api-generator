defmodule SpaceTraders.MarketTransaction do
  @moduledoc """
  Provides struct and type for a MarketTransaction
  """

  @type t :: %__MODULE__{
          pricePerUnit: integer,
          shipSymbol: String.t(),
          timestamp: DateTime.t(),
          totalPrice: integer,
          tradeSymbol: String.t(),
          type: String.t(),
          units: integer,
          waypointSymbol: String.t()
        }

  defstruct [
    :pricePerUnit,
    :shipSymbol,
    :timestamp,
    :totalPrice,
    :tradeSymbol,
    :type,
    :units,
    :waypointSymbol
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      pricePerUnit: :integer,
      shipSymbol: :string,
      timestamp: {:string, "date-time"},
      totalPrice: :integer,
      tradeSymbol: :string,
      type: {:enum, ["PURCHASE", "SELL"]},
      units: :integer,
      waypointSymbol: :string
    ]
  end
end
