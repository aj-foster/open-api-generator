defmodule CatalogCategoryDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogCategoryDeleteJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogCategoryDeleteJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-category-bulk-delete-job"}
    ]
  end
end
