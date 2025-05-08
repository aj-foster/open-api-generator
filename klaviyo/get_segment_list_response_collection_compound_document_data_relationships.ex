defmodule GetSegmentListResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentListResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles:
            GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsProfiles.t() | nil,
          tags: GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {GetSegmentListResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
