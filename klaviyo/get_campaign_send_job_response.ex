defmodule GetCampaignSendJobResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignSendJobResponse
  """

  @type t :: %__MODULE__{data: CampaignSendJobResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CampaignSendJobResponseObjectResource, :t}]
  end
end
