defmodule GetTagResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: GetTagResponseCollectionCompoundDocumentDataRelationshipsCampaigns.t() | nil,
          flows: GetTagResponseCollectionCompoundDocumentDataRelationshipsFlows.t() | nil,
          lists: GetTagResponseCollectionCompoundDocumentDataRelationshipsLists.t() | nil,
          segments: GetTagResponseCollectionCompoundDocumentDataRelationshipsSegments.t() | nil,
          "tag-group":
            :"Elixir.GetTagResponseCollectionCompoundDocumentDataRelationshipsTag-group".t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {GetTagResponseCollectionCompoundDocumentDataRelationshipsCampaigns, :t},
      flows: {GetTagResponseCollectionCompoundDocumentDataRelationshipsFlows, :t},
      lists: {GetTagResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      segments: {GetTagResponseCollectionCompoundDocumentDataRelationshipsSegments, :t},
      "tag-group":
        {:"Elixir.GetTagResponseCollectionCompoundDocumentDataRelationshipsTag-group", :t}
    ]
  end
end
