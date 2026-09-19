defmodule Klaviyo.GetCampaignRecipientEstimationResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignRecipientEstimationResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.CampaignRecipientEstimationResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CampaignRecipientEstimationResponseObjectResource, :t}]
  end
end
