defmodule Klaviyo.GetCampaignMessageTemplateRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageTemplateRelationshipListResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCampaignMessageTemplateRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCampaignMessageTemplateRelationshipListResponseData, :t}]
  end
end
