defmodule Klaviyo.PostTagResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostTagResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: Klaviyo.PostTagResponseDataRelationshipsCampaigns.t() | nil,
          flows: Klaviyo.PostTagResponseDataRelationshipsFlows.t() | nil,
          lists: Klaviyo.PostTagResponseDataRelationshipsLists.t() | nil,
          segments: Klaviyo.PostTagResponseDataRelationshipsSegments.t() | nil,
          "tag-group": Klaviyo.PostTagResponseDataRelationshipsTagGroup.t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {Klaviyo.PostTagResponseDataRelationshipsCampaigns, :t},
      flows: {Klaviyo.PostTagResponseDataRelationshipsFlows, :t},
      lists: {Klaviyo.PostTagResponseDataRelationshipsLists, :t},
      segments: {Klaviyo.PostTagResponseDataRelationshipsSegments, :t},
      "tag-group": {Klaviyo.PostTagResponseDataRelationshipsTagGroup, :t}
    ]
  end
end
