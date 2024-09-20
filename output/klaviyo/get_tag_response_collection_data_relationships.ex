defmodule GetTagResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: GetTagResponseCollectionDataRelationshipsCampaigns.t() | nil,
          flows: GetTagResponseCollectionDataRelationshipsFlows.t() | nil,
          lists: GetTagResponseCollectionDataRelationshipsLists.t() | nil,
          segments: GetTagResponseCollectionDataRelationshipsSegments.t() | nil,
          "tag-group": :"Elixir.GetTagResponseCollectionDataRelationshipsTag-group".t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {GetTagResponseCollectionDataRelationshipsCampaigns, :t},
      flows: {GetTagResponseCollectionDataRelationshipsFlows, :t},
      lists: {GetTagResponseCollectionDataRelationshipsLists, :t},
      segments: {GetTagResponseCollectionDataRelationshipsSegments, :t},
      "tag-group": {:"Elixir.GetTagResponseCollectionDataRelationshipsTag-group", :t}
    ]
  end
end
