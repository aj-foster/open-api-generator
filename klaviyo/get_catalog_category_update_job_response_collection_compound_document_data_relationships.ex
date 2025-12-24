defmodule Klaviyo.GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationshipsCategories.t()
            | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {Klaviyo.GetCatalogCategoryUpdateJobResponseCollectionCompoundDocumentDataRelationshipsCategories,
         :t}
    ]
  end
end
