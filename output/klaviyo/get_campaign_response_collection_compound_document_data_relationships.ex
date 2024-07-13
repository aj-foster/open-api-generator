defmodule GetCampaignResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            :"Elixir.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaign-messages".t()
            | nil,
          tags: GetCampaignResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages":
        {:"Elixir.GetCampaignResponseCollectionCompoundDocumentDataRelationshipsCampaign-messages",
         :t},
      tags: {GetCampaignResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
