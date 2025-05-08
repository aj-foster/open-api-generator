defmodule PatchCampaignMessageResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCampaignMessageResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaign: PatchCampaignMessageResponseDataRelationshipsCampaign.t() | nil,
          template: PatchCampaignMessageResponseDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {PatchCampaignMessageResponseDataRelationshipsCampaign, :t},
      template: {PatchCampaignMessageResponseDataRelationshipsTemplate, :t}
    ]
  end
end
