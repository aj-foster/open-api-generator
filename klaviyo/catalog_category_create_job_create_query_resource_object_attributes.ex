defmodule Klaviyo.CatalogCategoryCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          categories:
            Klaviyo.CatalogCategoryCreateJobCreateQueryResourceObjectAttributesCategories.t()
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      categories:
        {Klaviyo.CatalogCategoryCreateJobCreateQueryResourceObjectAttributesCategories, :t}
    ]
  end
end
