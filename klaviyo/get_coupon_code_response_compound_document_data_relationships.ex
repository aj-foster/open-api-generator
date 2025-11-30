defmodule Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationshipsCoupon.t() | nil,
          profile: Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationshipsCoupon, :t},
      profile: {Klaviyo.GetCouponCodeResponseCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
