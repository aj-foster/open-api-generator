defmodule Mollie.EntityInvoiceLinks do
  @moduledoc """
  Provides struct and type for a EntityInvoiceLinks
  """

  @type t :: %__MODULE__{
          documentation: Mollie.Url.t() | nil,
          pdf: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  defstruct [:documentation, :pdf, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [documentation: {Mollie.Url, :t}, pdf: {Mollie.Url, :t}, self: {Mollie.Url, :t}]
  end
end
