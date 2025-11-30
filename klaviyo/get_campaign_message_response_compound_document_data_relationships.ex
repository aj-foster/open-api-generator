defmodule Klaviyo.GetCampaignMessageResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignMessageResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaign:
            Klaviyo.GetCampaignMessageResponseCompoundDocumentDataRelationshipsCampaign.t() | nil,
          template:
            Klaviyo.GetCampaignMessageResponseCompoundDocumentDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {Klaviyo.GetCampaignMessageResponseCompoundDocumentDataRelationshipsCampaign, :t},
      template: {Klaviyo.GetCampaignMessageResponseCompoundDocumentDataRelationshipsTemplate, :t}
    ]
  end
end
