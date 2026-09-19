defmodule Mollie.UpdateValuesSalesInvoice do
  @moduledoc """
  Provides struct and type for a UpdateValuesSalesInvoice
  """

  @type t :: %__MODULE__{
          discount: Mollie.SalesInvoiceDiscount.t() | nil,
          emailDetails: Mollie.SalesInvoiceEmailDetails.t() | nil,
          lines: [map] | nil,
          memo: String.t() | nil,
          paymentDetails: Mollie.SalesInvoicePaymentDetails.t() | nil,
          paymentTerm: String.t() | nil,
          recipient: Mollie.SalesInvoiceRecipient.t() | nil,
          recipientIdentifier: String.t() | nil,
          status: String.t() | nil,
          testmode: boolean | nil
        }

  defstruct [
    :discount,
    :emailDetails,
    :lines,
    :memo,
    :paymentDetails,
    :paymentTerm,
    :recipient,
    :recipientIdentifier,
    :status,
    :testmode
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      discount: {:union, [{Mollie.SalesInvoiceDiscount, :t}, :null]},
      emailDetails: {:union, [{Mollie.SalesInvoiceEmailDetails, :t}, :null]},
      lines: {:union, [[:map], :null]},
      memo: {:union, [:string, :null]},
      paymentDetails: {Mollie.SalesInvoicePaymentDetails, :t},
      paymentTerm:
        {:enum, ["7 days", "14 days", "30 days", "45 days", "60 days", "90 days", "120 days"]},
      recipient: {:union, [{Mollie.SalesInvoiceRecipient, :t}, :null]},
      recipientIdentifier: :string,
      status: {:enum, ["draft", "issued", "paid"]},
      testmode: {:union, [:boolean, :null]}
    ]
  end
end
