defmodule GetListMemberResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListMemberResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: GetListMemberResponseCollectionDataRelationshipsLists.t() | nil,
          segments: GetListMemberResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {GetListMemberResponseCollectionDataRelationshipsLists, :t},
      segments: {GetListMemberResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
