defmodule Mollie.EntityBalanceTransactionContextPostPaymentSplitPayment do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextPostPaymentSplitPayment
  """

  @type t :: %__MODULE__{paymentId: String.t() | nil}

  defstruct [:paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paymentId: :string]
  end
end
