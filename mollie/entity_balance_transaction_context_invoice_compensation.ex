defmodule Mollie.EntityBalanceTransactionContextInvoiceCompensation do
  @moduledoc """
  Provides struct and type for a EntityBalanceTransactionContextInvoiceCompensation
  """

  @type t :: %__MODULE__{invoiceId: String.t() | nil}

  defstruct [:invoiceId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [invoiceId: :string]
  end
end
