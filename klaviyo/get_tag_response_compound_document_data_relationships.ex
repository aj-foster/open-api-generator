defmodule Klaviyo.GetTagResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsCampaigns.t() | nil,
          flows: Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsFlows.t() | nil,
          lists: Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsSegments.t() | nil,
          "tag-group": Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsTagGroup.t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsCampaigns, :t},
      flows: {Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsFlows, :t},
      lists: {Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsLists, :t},
      segments: {Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsSegments, :t},
      "tag-group": {Klaviyo.GetTagResponseCompoundDocumentDataRelationshipsTagGroup, :t}
    ]
  end
end
