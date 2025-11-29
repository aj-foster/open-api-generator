defmodule CouponCodeCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          "coupon-codes": CouponCodeCreateJobCreateQueryResourceObjectAttributesCouponCodes.t()
        }

  defstruct [:"coupon-codes"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["coupon-codes": {CouponCodeCreateJobCreateQueryResourceObjectAttributesCouponCodes, :t}]
  end
end
