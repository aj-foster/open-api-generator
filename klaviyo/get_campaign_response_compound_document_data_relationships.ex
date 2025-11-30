defmodule Klaviyo.GetCampaignResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsCampaignMessages.t() | nil,
          tags: Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages":
        {Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsCampaignMessages, :t},
      tags: {Klaviyo.GetCampaignResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
