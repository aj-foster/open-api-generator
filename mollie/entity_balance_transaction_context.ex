defmodule Mollie.EntityBalanceTransactionContext do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContext
  """

  @type t :: %__MODULE__{
          "application-fee": Mollie.EntityBalanceTransactionContextApplicationFee.t() | nil,
          "canceled-outgoing-transfer":
            Mollie.EntityBalanceTransactionContextCanceledOutgoingTransfer.t() | nil,
          capture: Mollie.EntityBalanceTransactionContextCapture.t() | nil,
          "capture-commision": Mollie.EntityBalanceTransactionContextCaptureCommision.t() | nil,
          "capture-rolling-reserve-release":
            Mollie.EntityBalanceTransactionContextCaptureRollingReserveRelease.t() | nil,
          chargeback: Mollie.EntityBalanceTransactionContextChargeback.t() | nil,
          "chargeback-compensation":
            Mollie.EntityBalanceTransactionContextChargebackCompensation.t() | nil,
          "chargeback-reversal":
            Mollie.EntityBalanceTransactionContextChargebackReversal.t() | nil,
          "failed-payment": Mollie.EntityBalanceTransactionContextFailedPayment.t() | nil,
          "failed-payment-fee": Mollie.EntityBalanceTransactionContextFailedPaymentFee.t() | nil,
          "invoice-compensation":
            Mollie.EntityBalanceTransactionContextInvoiceCompensation.t() | nil,
          "managed-fee": Mollie.EntityBalanceTransactionContextManagedFee.t() | nil,
          "outgoing-transfer": Mollie.EntityBalanceTransactionContextOutgoingTransfer.t() | nil,
          payment: Mollie.EntityBalanceTransactionContextPayment.t() | nil,
          "payment-commission": Mollie.EntityBalanceTransactionContextPaymentCommission.t() | nil,
          "payment-fee": Mollie.EntityBalanceTransactionContextPaymentFee.t() | nil,
          "platform-payment-chargeback":
            Mollie.EntityBalanceTransactionContextPlatformPaymentChargeback.t() | nil,
          "platform-payment-refund":
            Mollie.EntityBalanceTransactionContextPlatformPaymentRefund.t() | nil,
          "post-payment-split-payment":
            Mollie.EntityBalanceTransactionContextPostPaymentSplitPayment.t() | nil,
          refund: Mollie.EntityBalanceTransactionContextRefund.t() | nil,
          "refund-compensation":
            Mollie.EntityBalanceTransactionContextRefundCompensation.t() | nil,
          "reimbursement-fee": Mollie.EntityBalanceTransactionContextReimbursementFee.t() | nil,
          "returned-managed-fee":
            Mollie.EntityBalanceTransactionContextReturnedManagedFee.t() | nil,
          "returned-platform-payment-refund":
            Mollie.EntityBalanceTransactionContextReturnedPlatformPaymentRefund.t() | nil,
          "returned-refund": Mollie.EntityBalanceTransactionContextReturnedRefund.t() | nil,
          "returned-refund-compensation":
            Mollie.EntityBalanceTransactionContextReturnedRefundCompensation.t() | nil,
          "returned-transfer": Mollie.EntityBalanceTransactionContextReturnedTransfer.t() | nil,
          "reversed-chargeback-compensation":
            Mollie.EntityBalanceTransactionContextReversedChargebackCompensation.t() | nil,
          "reversed-platform-payment-chargeback":
            Mollie.EntityBalanceTransactionContextReversedPlatformPaymentChargeback.t() | nil,
          "split-payment": Mollie.EntityBalanceTransactionContextSplitPayment.t() | nil,
          "unauthorized-direct-debit":
            Mollie.EntityBalanceTransactionContextUnauthorizedDirectDebit.t() | nil
        }

  defstruct [
    :"application-fee",
    :"canceled-outgoing-transfer",
    :capture,
    :"capture-commision",
    :"capture-rolling-reserve-release",
    :chargeback,
    :"chargeback-compensation",
    :"chargeback-reversal",
    :"failed-payment",
    :"failed-payment-fee",
    :"invoice-compensation",
    :"managed-fee",
    :"outgoing-transfer",
    :payment,
    :"payment-commission",
    :"payment-fee",
    :"platform-payment-chargeback",
    :"platform-payment-refund",
    :"post-payment-split-payment",
    :refund,
    :"refund-compensation",
    :"reimbursement-fee",
    :"returned-managed-fee",
    :"returned-platform-payment-refund",
    :"returned-refund",
    :"returned-refund-compensation",
    :"returned-transfer",
    :"reversed-chargeback-compensation",
    :"reversed-platform-payment-chargeback",
    :"split-payment",
    :"unauthorized-direct-debit"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "application-fee":
        {:union, [{Mollie.EntityBalanceTransactionContextApplicationFee, :t}, :null]},
      "canceled-outgoing-transfer":
        {:union, [{Mollie.EntityBalanceTransactionContextCanceledOutgoingTransfer, :t}, :null]},
      capture: {:union, [{Mollie.EntityBalanceTransactionContextCapture, :t}, :null]},
      "capture-commision":
        {:union, [{Mollie.EntityBalanceTransactionContextCaptureCommision, :t}, :null]},
      "capture-rolling-reserve-release":
        {:union,
         [{Mollie.EntityBalanceTransactionContextCaptureRollingReserveRelease, :t}, :null]},
      chargeback: {:union, [{Mollie.EntityBalanceTransactionContextChargeback, :t}, :null]},
      "chargeback-compensation":
        {:union, [{Mollie.EntityBalanceTransactionContextChargebackCompensation, :t}, :null]},
      "chargeback-reversal":
        {:union, [{Mollie.EntityBalanceTransactionContextChargebackReversal, :t}, :null]},
      "failed-payment":
        {:union, [{Mollie.EntityBalanceTransactionContextFailedPayment, :t}, :null]},
      "failed-payment-fee":
        {:union, [{Mollie.EntityBalanceTransactionContextFailedPaymentFee, :t}, :null]},
      "invoice-compensation":
        {:union, [{Mollie.EntityBalanceTransactionContextInvoiceCompensation, :t}, :null]},
      "managed-fee": {:union, [{Mollie.EntityBalanceTransactionContextManagedFee, :t}, :null]},
      "outgoing-transfer":
        {:union, [{Mollie.EntityBalanceTransactionContextOutgoingTransfer, :t}, :null]},
      payment: {:union, [{Mollie.EntityBalanceTransactionContextPayment, :t}, :null]},
      "payment-commission":
        {:union, [{Mollie.EntityBalanceTransactionContextPaymentCommission, :t}, :null]},
      "payment-fee": {:union, [{Mollie.EntityBalanceTransactionContextPaymentFee, :t}, :null]},
      "platform-payment-chargeback":
        {:union, [{Mollie.EntityBalanceTransactionContextPlatformPaymentChargeback, :t}, :null]},
      "platform-payment-refund":
        {:union, [{Mollie.EntityBalanceTransactionContextPlatformPaymentRefund, :t}, :null]},
      "post-payment-split-payment":
        {:union, [{Mollie.EntityBalanceTransactionContextPostPaymentSplitPayment, :t}, :null]},
      refund: {:union, [{Mollie.EntityBalanceTransactionContextRefund, :t}, :null]},
      "refund-compensation":
        {:union, [{Mollie.EntityBalanceTransactionContextRefundCompensation, :t}, :null]},
      "reimbursement-fee":
        {:union, [{Mollie.EntityBalanceTransactionContextReimbursementFee, :t}, :null]},
      "returned-managed-fee":
        {:union, [{Mollie.EntityBalanceTransactionContextReturnedManagedFee, :t}, :null]},
      "returned-platform-payment-refund":
        {:union,
         [{Mollie.EntityBalanceTransactionContextReturnedPlatformPaymentRefund, :t}, :null]},
      "returned-refund":
        {:union, [{Mollie.EntityBalanceTransactionContextReturnedRefund, :t}, :null]},
      "returned-refund-compensation":
        {:union, [{Mollie.EntityBalanceTransactionContextReturnedRefundCompensation, :t}, :null]},
      "returned-transfer":
        {:union, [{Mollie.EntityBalanceTransactionContextReturnedTransfer, :t}, :null]},
      "reversed-chargeback-compensation":
        {:union,
         [{Mollie.EntityBalanceTransactionContextReversedChargebackCompensation, :t}, :null]},
      "reversed-platform-payment-chargeback":
        {:union,
         [{Mollie.EntityBalanceTransactionContextReversedPlatformPaymentChargeback, :t}, :null]},
      "split-payment":
        {:union, [{Mollie.EntityBalanceTransactionContextSplitPayment, :t}, :null]},
      "unauthorized-direct-debit":
        {:union, [{Mollie.EntityBalanceTransactionContextUnauthorizedDirectDebit, :t}, :null]}
    ]
  end
end
