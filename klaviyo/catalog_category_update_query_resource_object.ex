defmodule Klaviyo.CatalogCategoryUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CatalogCategoryUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          relationships: Klaviyo.CatalogCategoryUpdateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CatalogCategoryUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      relationships: {Klaviyo.CatalogCategoryUpdateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
