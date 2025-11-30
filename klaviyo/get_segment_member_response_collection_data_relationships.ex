defmodule Klaviyo.GetSegmentMemberResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentMemberResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.GetSegmentMemberResponseCollectionDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetSegmentMemberResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetSegmentMemberResponseCollectionDataRelationshipsLists, :t},
      segments: {Klaviyo.GetSegmentMemberResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
