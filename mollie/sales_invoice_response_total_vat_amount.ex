defmodule Mollie.SalesInvoiceResponseTotalVatAmount do
  @moduledoc """
  Provides struct and type for a SalesInvoiceResponseTotalVatAmount
  """

  @type t :: %__MODULE__{currency: String.t() | nil, value: String.t() | nil}

  defstruct [:currency, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [currency: :string, value: :string]
  end
end
