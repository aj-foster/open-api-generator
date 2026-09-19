defmodule SpaceTraders.ContractDeliverGood do
  @moduledoc """
  Provides struct and type for a ContractDeliverGood
  """

  @type t :: %__MODULE__{
          destinationSymbol: String.t(),
          tradeSymbol: String.t(),
          unitsFulfilled: integer,
          unitsRequired: integer
        }

  defstruct [:destinationSymbol, :tradeSymbol, :unitsFulfilled, :unitsRequired]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      destinationSymbol: :string,
      tradeSymbol: :string,
      unitsFulfilled: :integer,
      unitsRequired: :integer
    ]
  end
end
