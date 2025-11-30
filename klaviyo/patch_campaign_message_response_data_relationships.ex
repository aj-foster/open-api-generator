defmodule Klaviyo.PatchCampaignMessageResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaign: Klaviyo.PatchCampaignMessageResponseDataRelationshipsCampaign.t() | nil,
          template: Klaviyo.PatchCampaignMessageResponseDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {Klaviyo.PatchCampaignMessageResponseDataRelationshipsCampaign, :t},
      template: {Klaviyo.PatchCampaignMessageResponseDataRelationshipsTemplate, :t}
    ]
  end
end
