defmodule Mollie.SalesInvoiceRequestLinks do
  @moduledoc """
  Provides struct and type for a SalesInvoiceRequestLinks
  """

  @type t :: %__MODULE__{
          documentation: Mollie.Url.t() | nil,
          invoicePayment: Mollie.Url.t() | nil,
          next: Mollie.Url.t() | nil,
          pdfLink: Mollie.Url.t() | nil,
          previous: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  defstruct [:documentation, :invoicePayment, :next, :pdfLink, :previous, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation: {Mollie.Url, :t},
      invoicePayment: {Mollie.Url, :t},
      next: {Mollie.Url, :t},
      pdfLink: {Mollie.Url, :t},
      previous: {Mollie.Url, :t},
      self: {Mollie.Url, :t}
    ]
  end
end
