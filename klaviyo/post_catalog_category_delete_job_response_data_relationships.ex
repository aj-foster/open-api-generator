defmodule PostCatalogCategoryDeleteJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryDeleteJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          categories: PostCatalogCategoryDeleteJobResponseDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {PostCatalogCategoryDeleteJobResponseDataRelationshipsCategories, :t}]
  end
end
