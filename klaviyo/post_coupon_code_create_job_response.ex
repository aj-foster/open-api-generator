defmodule Klaviyo.PostCouponCodeCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCouponCodeCreateJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCouponCodeCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCouponCodeCreateJobResponseData, :t}]
  end
end
