defmodule CouponUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CouponUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CouponUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CouponUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "coupon"}
    ]
  end
end
