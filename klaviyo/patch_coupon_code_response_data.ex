defmodule Klaviyo.PatchCouponCodeResponseData do
  @moduledoc """
  Provides struct and type for a PatchCouponCodeResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCouponCodeResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCouponCodeResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCouponCodeResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCouponCodeResponseDataRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
