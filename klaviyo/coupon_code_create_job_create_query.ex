defmodule Klaviyo.CouponCodeCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CouponCodeCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CouponCodeCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CouponCodeCreateJobCreateQueryResourceObject, :t}]
  end
end
