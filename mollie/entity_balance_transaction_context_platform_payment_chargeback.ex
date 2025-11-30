defmodule Mollie.EntityBalanceTransactionContextPlatformPaymentChargeback do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextPlatformPaymentChargeback
  """

  @type t :: %__MODULE__{
          chargebackDescription: String.t() | nil,
          chargebackId: String.t() | nil,
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil
        }

  defstruct [:chargebackDescription, :chargebackId, :paymentDescription, :paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chargebackDescription: {:string, :generic},
      chargebackId: {:string, :generic},
      paymentDescription: {:string, :generic},
      paymentId: {:string, :generic}
    ]
  end
end
