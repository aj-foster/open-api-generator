defmodule Klaviyo.CouponUpdateQuery do
  @moduledoc """
  Provides struct and type for a CouponUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CouponUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CouponUpdateQueryResourceObject, :t}]
  end
end
