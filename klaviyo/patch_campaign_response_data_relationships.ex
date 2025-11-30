defmodule Klaviyo.PatchCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            Klaviyo.PatchCampaignResponseDataRelationshipsCampaignMessages.t() | nil,
          tags: Klaviyo.PatchCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages": {Klaviyo.PatchCampaignResponseDataRelationshipsCampaignMessages, :t},
      tags: {Klaviyo.PatchCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
