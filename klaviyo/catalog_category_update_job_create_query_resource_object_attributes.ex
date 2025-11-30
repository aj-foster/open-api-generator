defmodule Klaviyo.CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories.t()
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {Klaviyo.CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories, :t}
    ]
  end
end
