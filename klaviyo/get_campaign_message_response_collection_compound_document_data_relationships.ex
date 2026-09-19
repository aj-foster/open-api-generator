defmodule Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaign:
            Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsCampaign.t()
            | nil,
          template:
            Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate.t()
            | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign:
        {Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsCampaign,
         :t},
      template:
        {Klaviyo.GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate,
         :t}
    ]
  end
end
