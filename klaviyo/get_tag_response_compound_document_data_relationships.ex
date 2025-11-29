defmodule GetTagResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: GetTagResponseCompoundDocumentDataRelationshipsCampaigns.t() | nil,
          flows: GetTagResponseCompoundDocumentDataRelationshipsFlows.t() | nil,
          lists: GetTagResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          segments: GetTagResponseCompoundDocumentDataRelationshipsSegments.t() | nil,
          "tag-group": GetTagResponseCompoundDocumentDataRelationshipsTagGroup.t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {GetTagResponseCompoundDocumentDataRelationshipsCampaigns, :t},
      flows: {GetTagResponseCompoundDocumentDataRelationshipsFlows, :t},
      lists: {GetTagResponseCompoundDocumentDataRelationshipsLists, :t},
      segments: {GetTagResponseCompoundDocumentDataRelationshipsSegments, :t},
      "tag-group": {GetTagResponseCompoundDocumentDataRelationshipsTagGroup, :t}
    ]
  end
end
