defmodule CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          categories: CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories.t()
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories, :t}]
  end
end
