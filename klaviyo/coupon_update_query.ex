defmodule CouponUpdateQuery do
  @moduledoc """
  Provides struct and type for a CouponUpdateQuery
  """

  @type t :: %__MODULE__{data: CouponUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CouponUpdateQueryResourceObject, :t}]
  end
end
