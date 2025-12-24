defmodule Klaviyo.GetCouponRelationshipCouponCodesListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCouponRelationshipCouponCodesListResponseCollection
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCouponRelationshipCouponCodesListResponseCollectionData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetCouponRelationshipCouponCodesListResponseCollectionData, :t}]]
  end
end
