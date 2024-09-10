defmodule GetCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            :"Elixir.GetCampaignResponseDataRelationshipsCampaign-messages".t() | nil,
          tags: GetCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages": {:"Elixir.GetCampaignResponseDataRelationshipsCampaign-messages", :t},
      tags: {GetCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
