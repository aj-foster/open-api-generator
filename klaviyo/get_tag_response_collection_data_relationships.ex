defmodule Klaviyo.GetTagResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: Klaviyo.GetTagResponseCollectionDataRelationshipsCampaigns.t() | nil,
          flows: Klaviyo.GetTagResponseCollectionDataRelationshipsFlows.t() | nil,
          lists: Klaviyo.GetTagResponseCollectionDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetTagResponseCollectionDataRelationshipsSegments.t() | nil,
          "tag-group": Klaviyo.GetTagResponseCollectionDataRelationshipsTagGroup.t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {Klaviyo.GetTagResponseCollectionDataRelationshipsCampaigns, :t},
      flows: {Klaviyo.GetTagResponseCollectionDataRelationshipsFlows, :t},
      lists: {Klaviyo.GetTagResponseCollectionDataRelationshipsLists, :t},
      segments: {Klaviyo.GetTagResponseCollectionDataRelationshipsSegments, :t},
      "tag-group": {Klaviyo.GetTagResponseCollectionDataRelationshipsTagGroup, :t}
    ]
  end
end
