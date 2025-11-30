defmodule Klaviyo.GetCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            Klaviyo.GetCampaignResponseDataRelationshipsCampaignMessages.t() | nil,
          tags: Klaviyo.GetCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages": {Klaviyo.GetCampaignResponseDataRelationshipsCampaignMessages, :t},
      tags: {Klaviyo.GetCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
