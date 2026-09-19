defmodule Klaviyo.PostCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            Klaviyo.PostCampaignResponseDataRelationshipsCampaignMessages.t() | nil,
          tags: Klaviyo.PostCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages": {Klaviyo.PostCampaignResponseDataRelationshipsCampaignMessages, :t},
      tags: {Klaviyo.PostCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
