defmodule GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessages do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessages
  """

  @type t :: %__MODULE__{
          data: [
            GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessagesData.t()
          ],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessagesData, :t}
      ],
      links: {RelationshipLinks, :t}
    ]
  end
end
