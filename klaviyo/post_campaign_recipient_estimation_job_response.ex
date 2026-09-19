defmodule Klaviyo.PostCampaignRecipientEstimationJobResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignRecipientEstimationJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCampaignRecipientEstimationJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCampaignRecipientEstimationJobResponseData, :t}]
  end
end
