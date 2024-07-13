defmodule GetCampaignResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            :"Elixir.GetCampaignResponseCompoundDocumentDataRelationshipsCampaign-messages".t()
            | nil,
          tags: GetCampaignResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages":
        {:"Elixir.GetCampaignResponseCompoundDocumentDataRelationshipsCampaign-messages", :t},
      tags: {GetCampaignResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
