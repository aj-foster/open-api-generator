defmodule CouponCodeUpdateQuery do
  @moduledoc """
  Provides struct and type for a CouponCodeUpdateQuery
  """

  @type t :: %__MODULE__{data: CouponCodeUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CouponCodeUpdateQueryResourceObject, :t}]
  end
end
