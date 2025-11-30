defmodule Klaviyo.PostCatalogCategoryDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogCategoryDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogCategoryDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogCategoryDeleteJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogCategoryDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-delete-job"}
    ]
  end
end
