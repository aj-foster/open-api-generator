defmodule PostCouponResponse do
  @moduledoc """
  Provides struct and type for a PostCouponResponse
  """

  @type t :: %__MODULE__{data: PostCouponResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCouponResponseData, :t}]
  end
end
