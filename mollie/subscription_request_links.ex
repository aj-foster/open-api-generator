defmodule Mollie.SubscriptionRequestLinks do
  @moduledoc """
  Provides struct and type for a SubscriptionRequestLinks
  """

  @type t :: %__MODULE__{
          customer: Mollie.UrlNullable.t() | nil,
          documentation: Mollie.Url.t(),
          mandate: Mollie.UrlNullable.t() | nil,
          payments: Mollie.UrlNullable.t() | nil,
          profile: Mollie.UrlNullable.t() | nil,
          self: Mollie.Url.t()
        }

  defstruct [:customer, :documentation, :mandate, :payments, :profile, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      customer: {:union, [{Mollie.UrlNullable, :t}, :null]},
      documentation: {Mollie.Url, :t},
      mandate: {:union, [{Mollie.UrlNullable, :t}, :null]},
      payments: {:union, [{Mollie.UrlNullable, :t}, :null]},
      profile: {:union, [{Mollie.UrlNullable, :t}, :null]},
      self: {Mollie.Url, :t}
    ]
  end
end
