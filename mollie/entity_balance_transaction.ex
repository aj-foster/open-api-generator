defmodule Mollie.EntityBalanceTransaction do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransaction
  """

  @type t :: %__MODULE__{
          context: Mollie.EntityBalanceTransactionContext.t() | nil,
          createdAt: String.t(),
          deductions: Mollie.AmountNullable.t() | nil,
          id: Mollie.EntityBalanceTransactionId.t(),
          initialAmount: Mollie.Amount.t(),
          resource: String.t(),
          resultAmount: Mollie.Amount.t(),
          type: String.t()
        }

  defstruct [
    :context,
    :createdAt,
    :deductions,
    :id,
    :initialAmount,
    :resource,
    :resultAmount,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      context: {Mollie.EntityBalanceTransactionContext, :t},
      createdAt: :string,
      deductions: {:union, [{Mollie.AmountNullable, :t}, :null]},
      id: {Mollie.EntityBalanceTransactionId, :t},
      initialAmount: {Mollie.Amount, :t},
      resource: :string,
      resultAmount: {Mollie.Amount, :t},
      type:
        {:enum,
         [
           "payment",
           "split-payment",
           "failed-payment",
           "failed-platform-split-payment",
           "failed-split-payment-compensation",
           "capture",
           "split-transaction",
           "refund",
           "platform-payment-refund",
           "returned-platform-payment-refund",
           "refund-compensation",
           "returned-refund-compensation",
           "returned-refund",
           "chargeback",
           "chargeback-reversal",
           "chargeback-compensation",
           "reversed-chargeback-compensation",
           "platform-payment-chargeback",
           "reversed-platform-payment-chargeback",
           "fee-prepayment",
           "outgoing-transfer",
           "incoming-transfer",
           "canceled-transfer",
           "returned-transfer",
           "balance-reserve",
           "balance-reserve-return",
           "invoice-rounding-compensation",
           "rolling-reserve-hold",
           "rolling-reserve-release",
           "balance-correction",
           "repayment",
           "loan",
           "balance-topup",
           "cash-collateral-issuance';",
           "cash-collateral-release",
           "pending-rolling-reserve",
           "to-be-released-rolling-reserve",
           "held-rolling-reserve",
           "released-rolling-reserve"
         ]}
    ]
  end
end
