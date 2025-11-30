defmodule Mollie.SalesInvoiceRequest do
  @moduledoc """
  Provides struct and type for a SalesInvoiceRequest
  """

  @type t :: %__MODULE__{
          _links: Mollie.SalesInvoiceRequestLinks.t() | nil,
          amountDue: Mollie.SalesInvoiceRequestAmountDue.t() | nil,
          createdAt: String.t() | nil,
          customerId: String.t() | nil,
          discount: Mollie.SalesInvoiceDiscount.t() | nil,
          discountedSubtotalAmount: Mollie.SalesInvoiceRequestDiscountedSubtotalAmount.t() | nil,
          dueAt: String.t() | nil,
          emailDetails: Mollie.SalesInvoiceEmailDetails.t() | nil,
          id: String.t() | nil,
          invoiceNumber: String.t() | nil,
          issuedAt: String.t() | nil,
          lines: [map] | nil,
          mandateId: String.t() | nil,
          memo: String.t() | nil,
          metadata: map | nil,
          mode: String.t() | nil,
          paidAt: String.t() | nil,
          paymentDetails: Mollie.SalesInvoicePaymentDetails.t() | nil,
          paymentTerm: String.t() | nil,
          profileId: String.t() | nil,
          recipient: Mollie.SalesInvoiceRecipient.t() | nil,
          recipientIdentifier: String.t() | nil,
          resource: String.t() | nil,
          status: String.t() | nil,
          subtotalAmount: Mollie.SalesInvoiceRequestSubtotalAmount.t() | nil,
          testmode: boolean | nil,
          totalAmount: Mollie.SalesInvoiceRequestTotalAmount.t() | nil,
          totalVatAmount: Mollie.SalesInvoiceRequestTotalVatAmount.t() | nil,
          vatMode: String.t() | nil,
          vatScheme: String.t() | nil
        }

  defstruct [
    :_links,
    :amountDue,
    :createdAt,
    :customerId,
    :discount,
    :discountedSubtotalAmount,
    :dueAt,
    :emailDetails,
    :id,
    :invoiceNumber,
    :issuedAt,
    :lines,
    :mandateId,
    :memo,
    :metadata,
    :mode,
    :paidAt,
    :paymentDetails,
    :paymentTerm,
    :profileId,
    :recipient,
    :recipientIdentifier,
    :resource,
    :status,
    :subtotalAmount,
    :testmode,
    :totalAmount,
    :totalVatAmount,
    :vatMode,
    :vatScheme
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.SalesInvoiceRequestLinks, :t},
      amountDue: {Mollie.SalesInvoiceRequestAmountDue, :t},
      createdAt: :string,
      customerId: :string,
      discount: {:union, [{Mollie.SalesInvoiceDiscount, :t}, :null]},
      discountedSubtotalAmount: {Mollie.SalesInvoiceRequestDiscountedSubtotalAmount, :t},
      dueAt: {:union, [:string, :null]},
      emailDetails: {:union, [{Mollie.SalesInvoiceEmailDetails, :t}, :null]},
      id: :string,
      invoiceNumber: {:union, [:string, :null]},
      issuedAt: {:union, [:string, :null]},
      lines: {:union, [[:map], :null]},
      mandateId: :string,
      memo: {:union, [:string, :null]},
      metadata: {:union, [:map, :null]},
      mode: {:enum, ["live", "test"]},
      paidAt: {:union, [:string, :null]},
      paymentDetails: {Mollie.SalesInvoicePaymentDetails, :t},
      paymentTerm:
        {:enum, ["7 days", "14 days", "30 days", "45 days", "60 days", "90 days", "120 days"]},
      profileId: {:union, [:string, :null]},
      recipient: {:union, [{Mollie.SalesInvoiceRecipient, :t}, :null]},
      recipientIdentifier: :string,
      resource: :string,
      status: {:enum, ["draft", "issued", "paid"]},
      subtotalAmount: {Mollie.SalesInvoiceRequestSubtotalAmount, :t},
      testmode: {:union, [:boolean, :null]},
      totalAmount: {Mollie.SalesInvoiceRequestTotalAmount, :t},
      totalVatAmount: {Mollie.SalesInvoiceRequestTotalVatAmount, :t},
      vatMode: {:enum, ["exclusive", "inclusive"]},
      vatScheme: {:enum, ["standard", "one-stop-shop"]}
    ]
  end
end
