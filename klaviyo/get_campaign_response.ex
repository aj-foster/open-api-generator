defmodule Klaviyo.GetCampaignResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCampaignResponseData, :t}]
  end
end
