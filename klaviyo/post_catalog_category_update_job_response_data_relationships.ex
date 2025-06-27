defmodule PostCatalogCategoryUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          categories: PostCatalogCategoryUpdateJobResponseDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {PostCatalogCategoryUpdateJobResponseDataRelationshipsCategories, :t}]
  end
end
