defmodule PostCampaignMessageResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaign: PostCampaignMessageResponseDataRelationshipsCampaign.t() | nil,
          template: PostCampaignMessageResponseDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {PostCampaignMessageResponseDataRelationshipsCampaign, :t},
      template: {PostCampaignMessageResponseDataRelationshipsTemplate, :t}
    ]
  end
end
