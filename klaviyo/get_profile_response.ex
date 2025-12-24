defmodule Klaviyo.GetProfileResponse do
  @moduledoc """
  Provides struct and type for a GetProfileResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetProfileResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetProfileResponseData, :t}]
  end
end
