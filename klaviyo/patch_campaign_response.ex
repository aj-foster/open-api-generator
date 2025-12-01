defmodule Klaviyo.PatchCampaignResponse do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchCampaignResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchCampaignResponseData, :t}]
  end
end
