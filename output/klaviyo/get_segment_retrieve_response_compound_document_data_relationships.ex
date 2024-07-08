defmodule GetSegmentRetrieveResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsProfiles.t() | nil,
          tags: GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
