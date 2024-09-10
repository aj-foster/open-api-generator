defmodule PatchCatalogCategoryResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCatalogCategoryResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCatalogCategoryResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCatalogCategoryResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCatalogCategoryResponseDataRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
