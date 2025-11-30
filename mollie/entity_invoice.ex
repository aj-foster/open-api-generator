defmodule Mollie.EntityInvoice do
  @moduledoc """
  Provides struct and type for a EntityInvoice
  """

  @type t :: %__MODULE__{
          _links: Mollie.EntityInvoiceLinks.t(),
          dueAt: String.t() | nil,
          grossAmount: Mollie.EntityInvoiceGrossAmount.t(),
          id: Mollie.EntityInvoiceId.t(),
          issuedAt: String.t(),
          lines: [Mollie.EntityInvoiceLines.t()],
          netAmount: Mollie.EntityInvoiceNetAmount.t(),
          paidAt: String.t() | nil,
          reference: String.t(),
          resource: String.t(),
          status: Mollie.EntityInvoiceStatus.t(),
          vatAmount: Mollie.EntityInvoiceVatAmount.t(),
          vatNumber: String.t() | nil
        }

  defstruct [
    :_links,
    :dueAt,
    :grossAmount,
    :id,
    :issuedAt,
    :lines,
    :netAmount,
    :paidAt,
    :reference,
    :resource,
    :status,
    :vatAmount,
    :vatNumber
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {Mollie.EntityInvoiceLinks, :t},
      dueAt: {:union, [:string, :null]},
      grossAmount: {Mollie.EntityInvoiceGrossAmount, :t},
      id: {Mollie.EntityInvoiceId, :t},
      issuedAt: :string,
      lines: [{Mollie.EntityInvoiceLines, :t}],
      netAmount: {Mollie.EntityInvoiceNetAmount, :t},
      paidAt: {:union, [:string, :null]},
      reference: :string,
      resource: :string,
      status: {Mollie.EntityInvoiceStatus, :t},
      vatAmount: {Mollie.EntityInvoiceVatAmount, :t},
      vatNumber: {:union, [:string, :null]}
    ]
  end
end
