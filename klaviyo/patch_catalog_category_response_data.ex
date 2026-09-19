defmodule Klaviyo.PatchCatalogCategoryResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCatalogCategoryResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCatalogCategoryResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCatalogCategoryResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCatalogCategoryResponseDataRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
