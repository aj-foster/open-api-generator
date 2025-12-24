defmodule Mollie.EntityBalanceTransactionContextFailedPayment do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextFailedPayment
  """

  @type t :: %__MODULE__{paymentDescription: String.t() | nil, paymentId: String.t() | nil}

  defstruct [:paymentDescription, :paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paymentDescription: :string, paymentId: :string]
  end
end
