defmodule GetCampaignRecipientEstimationJobResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignRecipientEstimationJobResponse
  """

  @type t :: %__MODULE__{data: CampaignRecipientEstimationJobResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignRecipientEstimationJobResponseObjectResource, :t}]
  end
end
