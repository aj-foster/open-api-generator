defmodule PostCampaignSendJobResponse do
  @moduledoc """
  Provides struct and type for a PostCampaignSendJobResponse
  """

  @type t :: %__MODULE__{data: PostCampaignSendJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCampaignSendJobResponseData, :t}]
  end
end
