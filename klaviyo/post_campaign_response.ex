defmodule Klaviyo.PostCampaignResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCampaignResponseData, :t}]
  end
end
