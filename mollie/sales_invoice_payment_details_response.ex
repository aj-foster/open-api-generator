defmodule Mollie.SalesInvoicePaymentDetailsResponse do
  @moduledoc """
  Provides struct and type for a SalesInvoicePaymentDetailsResponse
  """

  @type t :: %__MODULE__{source: String.t(), sourceReference: String.t() | nil}

  defstruct [:source, :sourceReference]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      source: {:enum, ["manual", "payment-link", "payment"]},
      sourceReference: {:union, [:string, :null]}
    ]
  end
end
