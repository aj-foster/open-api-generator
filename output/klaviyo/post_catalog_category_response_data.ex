defmodule PostCatalogCategoryResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogCategoryResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogCategoryResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogCategoryResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogCategoryResponseDataRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
