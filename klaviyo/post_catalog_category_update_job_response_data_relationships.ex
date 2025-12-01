defmodule Klaviyo.PostCatalogCategoryUpdateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryUpdateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.PostCatalogCategoryUpdateJobResponseDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {Klaviyo.PostCatalogCategoryUpdateJobResponseDataRelationshipsCategories, :t}]
  end
end
