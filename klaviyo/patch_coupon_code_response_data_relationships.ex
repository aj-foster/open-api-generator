defmodule Klaviyo.PatchCouponCodeResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCouponCodeResponseDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: Klaviyo.PatchCouponCodeResponseDataRelationshipsCoupon.t() | nil,
          profile: Klaviyo.PatchCouponCodeResponseDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {Klaviyo.PatchCouponCodeResponseDataRelationshipsCoupon, :t},
      profile: {Klaviyo.PatchCouponCodeResponseDataRelationshipsProfile, :t}
    ]
  end
end
