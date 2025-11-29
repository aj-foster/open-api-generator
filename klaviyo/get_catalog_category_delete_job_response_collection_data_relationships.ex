defmodule GetCatalogCategoryDeleteJobResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryDeleteJobResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            GetCatalogCategoryDeleteJobResponseCollectionDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {GetCatalogCategoryDeleteJobResponseCollectionDataRelationshipsCategories, :t}]
  end
end
