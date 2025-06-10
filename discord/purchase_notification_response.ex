defmodule PurchaseNotificationResponse do
  @moduledoc """
  Provides struct and type for a PurchaseNotificationResponse
  """

  @type t :: %__MODULE__{
          guild_product_purchase: GuildProductPurchaseResponse.t() | nil,
          type: integer
        }

  defstruct [:guild_product_purchase, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      guild_product_purchase: {:union, [{GuildProductPurchaseResponse, :t}, :null]},
      type: :integer
    ]
  end
end
