defmodule Klaviyo.PostCatalogCategoryResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogCategoryResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogCategoryResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogCategoryResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogCategoryResponseDataRelationships, :t},
      type: {:const, "catalog-category"}
    ]
  end
end
