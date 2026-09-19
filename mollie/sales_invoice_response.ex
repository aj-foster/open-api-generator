defmodule Mollie.SalesInvoiceResponse do
  @moduledoc """
  Provides struct and type for a SalesInvoiceResponse
  """

  @type t :: %__MODULE__{
          _links: Mollie.SalesInvoiceResponseLinks.t() | nil,
          amountDue: Mollie.SalesInvoiceResponseAmountDue.t() | nil,
          createdAt: String.t() | nil,
          customerId: String.t() | nil,
          discount: Mollie.SalesInvoiceDiscountResponse.t() | nil,
          discountedSubtotalAmount: Mollie.SalesInvoiceResponseDiscountedSubtotalAmount.t() | nil,
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
          paymentDetails: Mollie.SalesInvoicePaymentDetailsResponse.t() | nil,
          paymentTerm: String.t() | nil,
          profileId: String.t() | nil,
          recipient: Mollie.SalesInvoiceRecipientResponse.t() | nil,
          recipientIdentifier: String.t() | nil,
          resource: String.t() | nil,
          status: String.t() | nil,
          subtotalAmount: Mollie.SalesInvoiceResponseSubtotalAmount.t() | nil,
          testmode: boolean | nil,
          totalAmount: Mollie.SalesInvoiceResponseTotalAmount.t() | nil,
          totalVatAmount: Mollie.SalesInvoiceResponseTotalVatAmount.t() | nil,
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
      _links: {Mollie.SalesInvoiceResponseLinks, :t},
      amountDue: {Mollie.SalesInvoiceResponseAmountDue, :t},
      createdAt: :string,
      customerId: :string,
      discount: {:union, [{Mollie.SalesInvoiceDiscountResponse, :t}, :null]},
      discountedSubtotalAmount: {Mollie.SalesInvoiceResponseDiscountedSubtotalAmount, :t},
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
      paymentDetails: {Mollie.SalesInvoicePaymentDetailsResponse, :t},
      paymentTerm:
        {:enum, ["7 days", "14 days", "30 days", "45 days", "60 days", "90 days", "120 days"]},
      profileId: {:union, [:string, :null]},
      recipient: {:union, [{Mollie.SalesInvoiceRecipientResponse, :t}, :null]},
      recipientIdentifier: :string,
      resource: :string,
      status: {:enum, ["draft", "issued", "paid"]},
      subtotalAmount: {Mollie.SalesInvoiceResponseSubtotalAmount, :t},
      testmode: {:union, [:boolean, :null]},
      totalAmount: {Mollie.SalesInvoiceResponseTotalAmount, :t},
      totalVatAmount: {Mollie.SalesInvoiceResponseTotalVatAmount, :t},
      vatMode: {:enum, ["exclusive", "inclusive"]},
      vatScheme: {:enum, ["standard", "one-stop-shop"]}
    ]
  end
end
