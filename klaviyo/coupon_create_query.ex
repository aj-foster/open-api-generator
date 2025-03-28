defmodule CouponCreateQuery do
  @moduledoc """
  Provides struct and type for a CouponCreateQuery
  """

  @type t :: %__MODULE__{data: CouponCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CouponCreateQueryResourceObject, :t}]
  end
end
