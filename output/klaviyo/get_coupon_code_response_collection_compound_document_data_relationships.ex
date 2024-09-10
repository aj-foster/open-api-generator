defmodule GetCouponCodeResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          coupon:
            GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsCoupon.t() | nil,
          profile:
            GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsCoupon, :t},
      profile: {GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
