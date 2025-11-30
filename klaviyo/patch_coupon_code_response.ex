defmodule Klaviyo.PatchCouponCodeResponse do
  @moduledoc """
  Provides struct and type for a PatchCouponCodeResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchCouponCodeResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchCouponCodeResponseData, :t}]
  end
end
