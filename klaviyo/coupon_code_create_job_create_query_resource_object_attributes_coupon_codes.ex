defmodule Klaviyo.CouponCodeCreateJobCreateQueryResourceObjectAttributesCouponCodes do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateJobCreateQueryResourceObjectAttributesCouponCodes
  """

  @type t :: %__MODULE__{data: [Klaviyo.CouponCodeCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.CouponCodeCreateQueryResourceObject, :t}]]
  end
end
