defmodule Mollie.EntityCustomerLinks do
  @moduledoc """
  Provides struct and type for a EntityCustomerLinks
  """

  @type t :: %__MODULE__{
          dashboard: Mollie.Url.t(),
          documentation: Mollie.Url.t(),
          mandates: Mollie.UrlNullable.t() | nil,
          payments: Mollie.UrlNullable.t() | nil,
          self: Mollie.Url.t(),
          subscriptions: Mollie.UrlNullable.t() | nil
        }

  defstruct [:dashboard, :documentation, :mandates, :payments, :self, :subscriptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dashboard: {Mollie.Url, :t},
      documentation: {Mollie.Url, :t},
      mandates: {:union, [{Mollie.UrlNullable, :t}, :null]},
      payments: {:union, [{Mollie.UrlNullable, :t}, :null]},
      self: {Mollie.Url, :t},
      subscriptions: {:union, [{Mollie.UrlNullable, :t}, :null]}
    ]
  end
end
