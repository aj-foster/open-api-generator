defmodule PostTagResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostTagResponseDataRelationships
  """

  @type t :: %__MODULE__{
          campaigns: PostTagResponseDataRelationshipsCampaigns.t() | nil,
          flows: PostTagResponseDataRelationshipsFlows.t() | nil,
          lists: PostTagResponseDataRelationshipsLists.t() | nil,
          segments: PostTagResponseDataRelationshipsSegments.t() | nil,
          "tag-group": :"Elixir.PostTagResponseDataRelationshipsTag-group".t() | nil
        }

  defstruct [:campaigns, :flows, :lists, :segments, :"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      campaigns: {PostTagResponseDataRelationshipsCampaigns, :t},
      flows: {PostTagResponseDataRelationshipsFlows, :t},
      lists: {PostTagResponseDataRelationshipsLists, :t},
      segments: {PostTagResponseDataRelationshipsSegments, :t},
      "tag-group": {:"Elixir.PostTagResponseDataRelationshipsTag-group", :t}
    ]
  end
end
