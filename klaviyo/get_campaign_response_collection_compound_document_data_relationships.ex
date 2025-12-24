defmodule Klaviyo.GetCampaignResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            Klaviyo.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessages.t()
            | nil,
          tags:
            Klaviyo.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages":
        {Klaviyo.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaignMessages,
         :t},
      tags: {Klaviyo.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
