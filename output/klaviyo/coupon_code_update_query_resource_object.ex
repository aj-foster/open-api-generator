defmodule CouponCodeUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CouponCodeUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CouponCodeUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CouponCodeUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "coupon-code"}
    ]
  end
end
