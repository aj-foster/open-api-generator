defmodule Klaviyo.PostCouponCodeResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponseDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: Klaviyo.PostCouponCodeResponseDataRelationshipsCoupon.t() | nil,
          profile: Klaviyo.PostCouponCodeResponseDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {Klaviyo.PostCouponCodeResponseDataRelationshipsCoupon, :t},
      profile: {Klaviyo.PostCouponCodeResponseDataRelationshipsProfile, :t}
    ]
  end
end
