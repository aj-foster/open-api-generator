defmodule Mollie.EntityBalanceTransactionContextSplitPayment do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextSplitPayment
  """

  @type t :: %__MODULE__{
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil,
          paymentOnwer: String.t() | nil
        }

  defstruct [:paymentDescription, :paymentId, :paymentOnwer]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paymentDescription: :string, paymentId: :string, paymentOnwer: :string]
  end
end
