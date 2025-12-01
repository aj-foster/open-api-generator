defmodule Klaviyo.PostCouponCodeCreateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCouponCodeCreateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "coupon-codes":
            Klaviyo.PostCouponCodeCreateJobResponseDataRelationshipsCouponCodes.t() | nil
        }

  defstruct [:"coupon-codes"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["coupon-codes": {Klaviyo.PostCouponCodeCreateJobResponseDataRelationshipsCouponCodes, :t}]
  end
end
