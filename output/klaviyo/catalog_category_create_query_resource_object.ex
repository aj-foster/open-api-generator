defmodule CatalogCategoryCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: CatalogCategoryCreateQueryResourceObjectAttributes.t(),
          relationships: CatalogCategoryCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {CatalogCategoryCreateQueryResourceObjectAttributes, :t},
      relationships: {CatalogCategoryCreateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
