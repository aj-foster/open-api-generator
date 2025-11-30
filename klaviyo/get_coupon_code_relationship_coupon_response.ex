defmodule Klaviyo.GetCouponCodeRelationshipCouponResponse do
  @moduledoc """
  Provides struct and type for a GetCouponCodeRelationshipCouponResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCouponCodeRelationshipCouponResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCouponCodeRelationshipCouponResponseData, :t}]
  end
end
