defmodule Klaviyo.CatalogCategoryCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.CatalogCategoryCreateQueryResourceObjectAttributes.t(),
          relationships: Klaviyo.CatalogCategoryCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.CatalogCategoryCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.CatalogCategoryCreateQueryResourceObjectRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
