defmodule GetCouponCodeRelationshipCouponResponseData do
  @moduledoc """
  Provides struct and type for a GetCouponCodeRelationshipCouponResponseData
  """

  @type t :: %__MODULE__{id: String.t(), type: String.t()}

  defstruct [:id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, type: {:const, "coupon"}]
  end
end
