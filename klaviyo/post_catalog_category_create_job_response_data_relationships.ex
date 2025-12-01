defmodule Klaviyo.PostCatalogCategoryCreateJobResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryCreateJobResponseDataRelationships
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.PostCatalogCategoryCreateJobResponseDataRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {Klaviyo.PostCatalogCategoryCreateJobResponseDataRelationshipsCategories, :t}]
  end
end
