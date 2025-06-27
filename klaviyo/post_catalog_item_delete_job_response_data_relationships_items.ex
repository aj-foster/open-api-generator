defmodule PostCatalogItemDeleteJobResponseDataRelationshipsItems do
  @moduledoc """
  Provides struct and type for a PostCatalogItemDeleteJobResponseDataRelationshipsItems
  """

  @type t :: %__MODULE__{
          data: [PostCatalogItemDeleteJobResponseDataRelationshipsItemsData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{PostCatalogItemDeleteJobResponseDataRelationshipsItemsData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
