defmodule GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategories.t()
            | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {GetCatalogCategoryCreateJobResponseCompoundDocumentDataRelationshipsCategories, :t}
    ]
  end
end
