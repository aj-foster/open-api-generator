defmodule GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTags do
  @moduledoc """
  Provides struct and type for a GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTags
  """

  @type t :: %__MODULE__{
          data: [GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTagsData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetSegmentRetrieveResponseCompoundDocumentDataRelationshipsTagsData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
