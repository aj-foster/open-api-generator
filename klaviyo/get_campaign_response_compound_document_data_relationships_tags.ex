defmodule Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsTags do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCompoundDocumentDataRelationshipsTags
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsTagsData.t()],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsTagsData, :t}],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
