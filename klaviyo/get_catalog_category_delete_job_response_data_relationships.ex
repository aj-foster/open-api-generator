defmodule GetCatalogCategoryDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          categories: GetCatalogCategoryDeleteJobResponseDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {GetCatalogCategoryDeleteJobResponseDataRelationshipsCategories, :t}]
  end
end
