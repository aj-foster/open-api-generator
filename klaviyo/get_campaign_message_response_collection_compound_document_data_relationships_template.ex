defmodule Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate
  """

  @type t :: %__MODULE__{
          data:
            Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplateData.t(),
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplateData,
         :t},
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
