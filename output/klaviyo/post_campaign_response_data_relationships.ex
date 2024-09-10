defmodule PostCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            :"Elixir.PostCampaignResponseDataRelationshipsCampaign-messages".t() | nil,
          tags: PostCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages": {:"Elixir.PostCampaignResponseDataRelationshipsCampaign-messages", :t},
      tags: {PostCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
