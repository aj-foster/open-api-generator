defmodule Klaviyo.PostCouponCodeResponseData do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCouponCodeResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCouponCodeResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCouponCodeResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCouponCodeResponseDataRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
