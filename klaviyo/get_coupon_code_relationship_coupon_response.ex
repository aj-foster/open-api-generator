defmodule GetCouponCodeRelationshipCouponResponse do
  @moduledoc """
  Provides struct and type for a GetCouponCodeRelationshipCouponResponse
  """

  @type t :: %__MODULE__{data: GetCouponCodeRelationshipCouponResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCouponCodeRelationshipCouponResponseData, :t}]
  end
end
