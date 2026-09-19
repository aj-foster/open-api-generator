defmodule Mollie.EntityBalanceTransactionContextChargebackCompensation do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextChargebackCompensation
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
      chargebackDescription: :string,
      chargebackId: :string,
      paymentDescription: :string,
      paymentId: :string
    ]
  end
end
