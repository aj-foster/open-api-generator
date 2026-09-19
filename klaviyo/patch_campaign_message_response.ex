defmodule Klaviyo.PatchCampaignMessageResponse do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchCampaignMessageResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchCampaignMessageResponseData, :t}]
  end
end
