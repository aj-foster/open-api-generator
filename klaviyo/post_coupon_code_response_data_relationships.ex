defmodule PostCouponCodeResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponseDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: PostCouponCodeResponseDataRelationshipsCoupon.t() | nil,
          profile: PostCouponCodeResponseDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {PostCouponCodeResponseDataRelationshipsCoupon, :t},
      profile: {PostCouponCodeResponseDataRelationshipsProfile, :t}
    ]
  end
end
