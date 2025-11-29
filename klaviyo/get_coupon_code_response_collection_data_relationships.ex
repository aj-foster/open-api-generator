defmodule GetCouponCodeResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: GetCouponCodeResponseCollectionDataRelationshipsCoupon.t() | nil,
          profile: GetCouponCodeResponseCollectionDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {GetCouponCodeResponseCollectionDataRelationshipsCoupon, :t},
      profile: {GetCouponCodeResponseCollectionDataRelationshipsProfile, :t}
    ]
  end
end
