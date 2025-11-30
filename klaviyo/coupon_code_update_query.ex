defmodule Klaviyo.CouponCodeUpdateQuery do
  @moduledoc """
  Provides struct and type for a CouponCodeUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CouponCodeUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CouponCodeUpdateQueryResourceObject, :t}]
  end
end
