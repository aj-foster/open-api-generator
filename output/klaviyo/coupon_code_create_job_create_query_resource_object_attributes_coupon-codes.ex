defmodule :"Elixir.CouponCodeCreateJobCreateQueryResourceObjectAttributesCoupon-codes" do
  @moduledoc """
  Provides struct and type for a :"Elixir.CouponCodeCreateJobCreateQueryResourceObjectAttributesCoupon-codes"
  """

  @type t :: %__MODULE__{data: [CouponCodeCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CouponCodeCreateQueryResourceObject, :t}]]
  end
end
