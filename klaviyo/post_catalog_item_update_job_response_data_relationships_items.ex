defmodule PostCatalogItemUpdateJobResponseDataRelationshipsItems do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponseDataRelationshipsItems
  """

  @type t :: %__MODULE__{
          data: [PostCatalogItemUpdateJobResponseDataRelationshipsItemsData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{PostCatalogItemUpdateJobResponseDataRelationshipsItemsData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
