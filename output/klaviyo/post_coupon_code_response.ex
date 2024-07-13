defmodule PostCouponCodeResponse do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponse
  """

  @type t :: %__MODULE__{data: PostCouponCodeResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCouponCodeResponseData, :t}]
  end
end
