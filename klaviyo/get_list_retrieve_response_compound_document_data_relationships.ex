defmodule GetListRetrieveResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetListRetrieveResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: GetListRetrieveResponseCompoundDocumentDataRelationshipsProfiles.t() | nil,
          tags: GetListRetrieveResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {GetListRetrieveResponseCompoundDocumentDataRelationshipsProfiles, :t},
      tags: {GetListRetrieveResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
