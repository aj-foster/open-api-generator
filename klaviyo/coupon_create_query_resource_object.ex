defmodule CouponCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CouponCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CouponCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {CouponCreateQueryResourceObjectAttributes, :t}, type: {:const, "coupon"}]
  end
end
