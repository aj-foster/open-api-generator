defmodule PostCampaignValuesResponseDTODataRelationshipsCampaigns do
  @moduledoc """
  Provides struct and type for a PostCampaignValuesResponseDTODataRelationshipsCampaigns
  """

  @type t :: %__MODULE__{
          data: [PostCampaignValuesResponseDTODataRelationshipsCampaignsData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{PostCampaignValuesResponseDTODataRelationshipsCampaignsData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
