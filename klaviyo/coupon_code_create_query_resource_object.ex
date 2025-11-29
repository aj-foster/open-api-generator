defmodule CouponCodeCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CouponCodeCreateQueryResourceObjectAttributes.t(),
          relationships: CouponCodeCreateQueryResourceObjectRelationships.t(),
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CouponCodeCreateQueryResourceObjectAttributes, :t},
      relationships: {CouponCodeCreateQueryResourceObjectRelationships, :t},
      type: {:const, "coupon-code"}
    ]
  end
end
