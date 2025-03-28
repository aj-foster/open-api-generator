defmodule CouponCodeCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CouponCodeCreateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CouponCodeCreateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "coupon-code-bulk-create-job"}
    ]
  end
end
