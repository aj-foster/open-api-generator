defmodule Klaviyo.PostCatalogCategoryUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogCategoryUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogCategoryUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogCategoryUpdateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogCategoryUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-update-job"}
    ]
  end
end
