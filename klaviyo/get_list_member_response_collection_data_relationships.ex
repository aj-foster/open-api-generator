defmodule Klaviyo.GetListMemberResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListMemberResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          lists: Klaviyo.GetListMemberResponseCollectionDataRelationshipsLists.t() | nil,
          segments: Klaviyo.GetListMemberResponseCollectionDataRelationshipsSegments.t() | nil
        }

  defstruct [:lists, :segments]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lists: {Klaviyo.GetListMemberResponseCollectionDataRelationshipsLists, :t},
      segments: {Klaviyo.GetListMemberResponseCollectionDataRelationshipsSegments, :t}
    ]
  end
end
