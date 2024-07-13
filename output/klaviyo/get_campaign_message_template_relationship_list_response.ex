defmodule GetCampaignMessageTemplateRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageTemplateRelationshipListResponse
  """

  @type t :: %__MODULE__{data: GetCampaignMessageTemplateRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCampaignMessageTemplateRelationshipListResponseData, :t}]
  end
end
