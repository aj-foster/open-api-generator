defmodule Klaviyo.PostCampaignMessageResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCampaignMessageResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaign: Klaviyo.PostCampaignMessageResponseDataRelationshipsCampaign.t() | nil,
          template: Klaviyo.PostCampaignMessageResponseDataRelationshipsTemplate.t() | nil
        }

  defstruct [:campaign, :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaign: {Klaviyo.PostCampaignMessageResponseDataRelationshipsCampaign, :t},
      template: {Klaviyo.PostCampaignMessageResponseDataRelationshipsTemplate, :t}
    ]
  end
end
