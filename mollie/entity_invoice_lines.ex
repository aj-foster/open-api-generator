defmodule Mollie.EntityInvoiceLines do
  @moduledoc """
  Provides struct and type for a EntityInvoiceLines
  """

  @type t :: %__MODULE__{
          amount: Mollie.Amount.t(),
          count: integer,
          description: String.t(),
          period: String.t(),
          vatPercentage: integer
        }

  defstruct [:amount, :count, :description, :period, :vatPercentage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      amount: {Mollie.Amount, :t},
      count: :integer,
      description: :string,
      period: :string,
      vatPercentage: :integer
    ]
  end
end
