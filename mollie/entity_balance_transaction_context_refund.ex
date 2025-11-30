defmodule Mollie.EntityBalanceTransactionContextRefund do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextRefund
  """

  @type t :: %__MODULE__{
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil,
          refundDescription: String.t() | nil,
          refundId: String.t() | nil
        }

  defstruct [:paymentDescription, :paymentId, :refundDescription, :refundId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      paymentDescription: :string,
      paymentId: :string,
      refundDescription: :string,
      refundId: :string
    ]
  end
end
