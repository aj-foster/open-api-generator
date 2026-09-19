defmodule Klaviyo.PostProfileResponse do
  @moduledoc """
  Provides struct and type for a PostProfileResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostProfileResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostProfileResponseData, :t}]
  end
end
