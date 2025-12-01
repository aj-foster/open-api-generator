defmodule Klaviyo.GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategories do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategories
  """

  @type t :: %__MODULE__{
          data: [
            Klaviyo.GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategoriesData.t()
          ],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {Klaviyo.GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategoriesData,
         :t}
      ],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
