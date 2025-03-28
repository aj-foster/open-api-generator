defmodule PatchCouponResponse do
  @moduledoc """
  Provides struct and type for a PatchCouponResponse
  """

  @type t :: %__MODULE__{data: PatchCouponResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchCouponResponseData, :t}]
  end
end
