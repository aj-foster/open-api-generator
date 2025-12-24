defmodule Mollie.PaymentRequestLinks do
  @moduledoc """
  Provides struct and type for a PaymentRequestLinks
  """

  @type t :: %__MODULE__{
          captures: Mollie.Url.t() | nil,
          changePaymentState: Mollie.Url.t() | nil,
          chargebacks: Mollie.Url.t() | nil,
          checkout: Mollie.Url.t() | nil,
          customer: Mollie.Url.t() | nil,
          dashboard: Mollie.Url.t(),
          documentation: Mollie.Url.t() | nil,
          mandate: Mollie.Url.t() | nil,
          mobileAppCheckout: Mollie.Url.t() | nil,
          order: Mollie.Url.t() | nil,
          payOnline: Mollie.Url.t() | nil,
          refunds: Mollie.Url.t() | nil,
          self: Mollie.Url.t(),
          settlement: Mollie.Url.t() | nil,
          status: Mollie.Url.t() | nil,
          subscription: Mollie.Url.t() | nil,
          terminal: Mollie.Url.t() | nil
        }

  defstruct [
    :captures,
    :changePaymentState,
    :chargebacks,
    :checkout,
    :customer,
    :dashboard,
    :documentation,
    :mandate,
    :mobileAppCheckout,
    :order,
    :payOnline,
    :refunds,
    :self,
    :settlement,
    :status,
    :subscription,
    :terminal
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      captures: {Mollie.Url, :t},
      changePaymentState: {Mollie.Url, :t},
      chargebacks: {Mollie.Url, :t},
      checkout: {Mollie.Url, :t},
      customer: {Mollie.Url, :t},
      dashboard: {Mollie.Url, :t},
      documentation: {Mollie.Url, :t},
      mandate: {Mollie.Url, :t},
      mobileAppCheckout: {Mollie.Url, :t},
      order: {Mollie.Url, :t},
      payOnline: {Mollie.Url, :t},
      refunds: {Mollie.Url, :t},
      self: {Mollie.Url, :t},
      settlement: {Mollie.Url, :t},
      status: {Mollie.Url, :t},
      subscription: {Mollie.Url, :t},
      terminal: {Mollie.Url, :t}
    ]
  end
end
