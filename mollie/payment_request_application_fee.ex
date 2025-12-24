defmodule Mollie.PaymentRequestApplicationFee do
  @moduledoc """
  Provides struct and type for a PaymentRequestApplicationFee
  """

  @type t :: %__MODULE__{amount: Mollie.Amount.t() | nil, description: String.t() | nil}

  defstruct [:amount, :description]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [amount: {Mollie.Amount, :t}, description: :string]
  end
end
