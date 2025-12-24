defmodule Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns:
            Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsCampaigns.t() | nil,
          flows: Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsFlows.t() | nil,
          lists: Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsLists.t() | nil,
          segments:
            Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsSegments.t() | nil,
          "tag-group":
            Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsTagGroup.t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsCampaigns, :t},
      flows: {Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsFlows, :t},
      lists: {Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsLists, :t},
      segments: {Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsSegments, :t},
      "tag-group": {Klaviyo.GetTagResponseCollectionCompoundDocumentDataRelationshipsTagGroup, :t}
    ]
  end
end
