defmodule Klaviyo.GetCouponCodeResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: Klaviyo.GetCouponCodeResponseCollectionDataRelationshipsCoupon.t() | nil,
          profile: Klaviyo.GetCouponCodeResponseCollectionDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {Klaviyo.GetCouponCodeResponseCollectionDataRelationshipsCoupon, :t},
      profile: {Klaviyo.GetCouponCodeResponseCollectionDataRelationshipsProfile, :t}
    ]
  end
end
