defmodule CatalogCategoryUpdateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogCategoryUpdateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "catalog-category-bulk-update-job"}
    ]
  end
end
