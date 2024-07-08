defmodule GetCampaignMessageResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaign: GetCampaignMessageResponseCompoundDocumentDataRelationshipsCampaign.t() | nil,
          template: GetCampaignMessageResponseCompoundDocumentDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {GetCampaignMessageResponseCompoundDocumentDataRelationshipsCampaign, :t},
      template: {GetCampaignMessageResponseCompoundDocumentDataRelationshipsTemplate, :t}
    ]
  end
end
