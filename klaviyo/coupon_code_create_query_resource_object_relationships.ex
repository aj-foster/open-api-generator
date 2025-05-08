defmodule CouponCodeCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{coupon: CouponCodeCreateQueryResourceObjectRelationshipsCoupon.t()}

  defstruct [:coupon]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [coupon: {CouponCodeCreateQueryResourceObjectRelationshipsCoupon, :t}]
  end
end
