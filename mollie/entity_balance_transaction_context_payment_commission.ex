defmodule Mollie.EntityBalanceTransactionContextPaymentCommission do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextPaymentCommission
  """

  @type t :: %__MODULE__{
          organizationId: String.t() | nil,
          paymentDescription: String.t() | nil,
          paymentId: String.t() | nil
        }

  defstruct [:organizationId, :paymentDescription, :paymentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [organizationId: :string, paymentDescription: :string, paymentId: :string]
  end
end
