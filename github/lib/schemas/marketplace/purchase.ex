defmodule GitHub.Marketplace.Purchase do
  @moduledoc """
  Provides struct and type for a Marketplace.Purchase
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          email: String.t() | nil,
          id: integer,
          login: String.t(),
          marketplace_pending_change:
            GitHub.Marketplace.PurchaseMarketplacePendingChange.t() | nil,
          marketplace_purchase: GitHub.Marketplace.PurchaseMarketplacePurchase.t(),
          organization_billing_email: String.t() | nil,
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :email,
    :id,
    :login,
    :marketplace_pending_change,
    :marketplace_purchase,
    :organization_billing_email,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, :generic}, :null]},
      id: :integer,
      login: {:string, :generic},
      marketplace_pending_change:
        {:union, [{GitHub.Marketplace.PurchaseMarketplacePendingChange, :t}, :null]},
      marketplace_purchase: {GitHub.Marketplace.PurchaseMarketplacePurchase, :t},
      organization_billing_email: {:string, :generic},
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
