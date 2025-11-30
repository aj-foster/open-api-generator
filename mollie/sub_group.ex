defmodule Mollie.SubGroup do
  @moduledoc """
  Provides struct and type for a SubGroup
  """

  @type t :: %__MODULE__{amount: Mollie.Amount.t() | nil, subtotals: [map] | nil}

  defstruct [:amount, :subtotals]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: {Mollie.Amount, :t}, subtotals: {:union, [[:map], :null]}]
  end
end
