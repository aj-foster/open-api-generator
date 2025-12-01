defmodule SpaceTraders.Market do
  @moduledoc """
  Provides struct and type for a Market
  """

  @type t :: %__MODULE__{
          exchange: [SpaceTraders.TradeGood.t()],
          exports: [SpaceTraders.TradeGood.t()],
          imports: [SpaceTraders.TradeGood.t()],
          symbol: String.t(),
          tradeGoods: [SpaceTraders.MarketTradeGood.t()] | nil,
          transactions: [SpaceTraders.MarketTransaction.t()] | nil
        }

  defstruct [:exchange, :exports, :imports, :symbol, :tradeGoods, :transactions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      exchange: [{SpaceTraders.TradeGood, :t}],
      exports: [{SpaceTraders.TradeGood, :t}],
      imports: [{SpaceTraders.TradeGood, :t}],
      symbol: :string,
      tradeGoods: [{SpaceTraders.MarketTradeGood, :t}],
      transactions: [{SpaceTraders.MarketTransaction, :t}]
    ]
  end
end
