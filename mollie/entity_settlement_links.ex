defmodule Mollie.EntitySettlementLinks do
  @moduledoc """
  Provides struct and type for a EntitySettlementLinks
  """

  @type t :: %__MODULE__{
          captures: Mollie.Url.t() | nil,
          chargebacks: Mollie.Url.t() | nil,
          documentation: Mollie.Url.t() | nil,
          invoice: Mollie.UrlNullable.t() | nil,
          payments: Mollie.Url.t() | nil,
          refunds: Mollie.Url.t() | nil,
          self: Mollie.Url.t()
        }

  defstruct [:captures, :chargebacks, :documentation, :invoice, :payments, :refunds, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      captures: {Mollie.Url, :t},
      chargebacks: {Mollie.Url, :t},
      documentation: {Mollie.Url, :t},
      invoice: {:union, [{Mollie.UrlNullable, :t}, :null]},
      payments: {Mollie.Url, :t},
      refunds: {Mollie.Url, :t},
      self: {Mollie.Url, :t}
    ]
  end
end
