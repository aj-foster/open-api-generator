defmodule CatalogCategoryCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogCategoryCreateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogCategoryCreateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-category-bulk-create-job"}
    ]
  end
end
