defmodule GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationshipsCategories.t()
            | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationshipsCategories,
         :t}
    ]
  end
end
