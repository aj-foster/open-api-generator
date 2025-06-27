defmodule GetCouponCodeResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCouponCodeResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          coupon: GetCouponCodeResponseCompoundDocumentDataRelationshipsCoupon.t() | nil,
          profile: GetCouponCodeResponseCompoundDocumentDataRelationshipsProfile.t() | nil
        }

  defstruct [:coupon, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      coupon: {GetCouponCodeResponseCompoundDocumentDataRelationshipsCoupon, :t},
      profile: {GetCouponCodeResponseCompoundDocumentDataRelationshipsProfile, :t}
    ]
  end
end
