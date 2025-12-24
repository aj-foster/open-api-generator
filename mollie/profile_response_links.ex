defmodule Mollie.ProfileResponseLinks do
  @moduledoc """
  Provides struct and type for a ProfileResponseLinks
  """

  @type t :: %__MODULE__{
          chargebacks: Mollie.Url.t() | nil,
          checkoutPreviewUrl: Mollie.Url.t() | nil,
          dashboard: Mollie.Url.t() | nil,
          documentation: Mollie.Url.t() | nil,
          methods: Mollie.Url.t() | nil,
          payments: Mollie.Url.t() | nil,
          refunds: Mollie.Url.t() | nil,
          self: Mollie.Url.t() | nil
        }

  defstruct [
    :chargebacks,
    :checkoutPreviewUrl,
    :dashboard,
    :documentation,
    :methods,
    :payments,
    :refunds,
    :self
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      chargebacks: {Mollie.Url, :t},
      checkoutPreviewUrl: {Mollie.Url, :t},
      dashboard: {Mollie.Url, :t},
      documentation: {Mollie.Url, :t},
      methods: {Mollie.Url, :t},
      payments: {Mollie.Url, :t},
      refunds: {Mollie.Url, :t},
      self: {Mollie.Url, :t}
    ]
  end
end
