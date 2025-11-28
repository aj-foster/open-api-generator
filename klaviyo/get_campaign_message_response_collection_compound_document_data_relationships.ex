defmodule GetCampaignMessageResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaign:
            GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsCampaign.t()
            | nil,
          template:
            GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate.t()
            | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign:
        {GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsCampaign, :t},
      template:
        {GetCampaignMessageResponseCollectionCompoundDocumentDataRelationshipsTemplate, :t}
    ]
  end
end
