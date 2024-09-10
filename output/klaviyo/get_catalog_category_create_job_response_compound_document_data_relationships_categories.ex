defmodule GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategories do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategories
  """

  @type t :: %__MODULE__{
          data: [
            GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategoriesData.t()
          ],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategoriesData, :t}
      ],
      links: {RelationshipLinks, :t}
    ]
  end
end
