defmodule Klaviyo.PostCampaignMessageResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCampaignMessageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCampaignMessageResponseData, :t}]
  end
end
