defmodule Mollie.SalesInvoiceDiscount do
  @moduledoc """
  Provides struct and type for a SalesInvoiceDiscount
  """

  @type t :: %__MODULE__{type: String.t(), value: String.t()}

  defstruct [:type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["amount", "percentage"]}, value: :string]
  end
end
