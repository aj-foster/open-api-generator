defmodule PatchCouponCodeResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCouponCodeResponseDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: PatchCouponCodeResponseDataRelationshipsCoupon.t() | nil,
          profile: PatchCouponCodeResponseDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {PatchCouponCodeResponseDataRelationshipsCoupon, :t},
      profile: {PatchCouponCodeResponseDataRelationshipsProfile, :t}
    ]
  end
end
