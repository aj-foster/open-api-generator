defmodule Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          coupon:
            Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsCoupon.t()
            | nil,
          profile:
            Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsProfile.t()
            | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon:
        {Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsCoupon, :t},
      profile:
        {Klaviyo.GetCouponCodeResponseCollectionCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
