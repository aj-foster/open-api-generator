defmodule GetListListResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListListResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles:
            GetListListResponseCollectionCompoundDocumentDataRelationshipsProfiles.t() | nil,
          tags: GetListListResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetListListResponseCollectionCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {GetListListResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
