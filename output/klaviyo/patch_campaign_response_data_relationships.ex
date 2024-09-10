defmodule PatchCampaignResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "campaign-messages":
            :"Elixir.PatchCampaignResponseDataRelationshipsCampaign-messages".t() | nil,
          tags: PatchCampaignResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"campaign-messages", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "campaign-messages":
        {:"Elixir.PatchCampaignResponseDataRelationshipsCampaign-messages", :t},
      tags: {PatchCampaignResponseDataRelationshipsTags, :t}
    ]
  end
end
