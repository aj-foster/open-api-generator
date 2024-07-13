defmodule GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategories.t()
            | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {GetCatalogCategoryCreateJobResponseCollectionCompoundDocumentDataRelationshipsCategories,
         :t}
    ]
  end
end
