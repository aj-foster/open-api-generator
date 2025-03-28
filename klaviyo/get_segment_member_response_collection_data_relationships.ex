defmodule GetSegmentMemberResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentMemberResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetSegmentMemberResponseCollectionDataRelationshipsLists.t() | nil,
          segments: GetSegmentMemberResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetSegmentMemberResponseCollectionDataRelationshipsLists, :t},
      segments: {GetSegmentMemberResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
