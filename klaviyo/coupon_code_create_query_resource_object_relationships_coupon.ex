defmodule Klaviyo.CouponCodeCreateQueryResourceObjectRelationshipsCoupon do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateQueryResourceObjectRelationshipsCoupon
  """

  @type t :: %__MODULE__{
          data: Klaviyo.CouponCodeCreateQueryResourceObjectRelationshipsCouponData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CouponCodeCreateQueryResourceObjectRelationshipsCouponData, :t}]
  end
end
