defmodule GetCampaignMessageCampaignRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageCampaignRelationshipListResponse
  """

  @type t :: %__MODULE__{data: GetCampaignMessageCampaignRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCampaignMessageCampaignRelationshipListResponseData, :t}]
  end
end
