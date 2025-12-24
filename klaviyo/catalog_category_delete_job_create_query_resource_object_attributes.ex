defmodule Klaviyo.CatalogCategoryDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogCategoryDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories.t()
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {Klaviyo.CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories, :t}
    ]
  end
end
