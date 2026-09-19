defmodule Klaviyo.PatchCampaignResponseDataRelationshipsTags do
  @moduledoc """
  Provides struct and type for a PatchCampaignResponseDataRelationshipsTags
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.PatchCampaignResponseDataRelationshipsTagsData.t()],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.PatchCampaignResponseDataRelationshipsTagsData, :t}],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
