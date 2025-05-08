defmodule PostCatalogCategoryDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogCategoryDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogCategoryDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogCategoryDeleteJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogCategoryDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-delete-job"}
    ]
  end
end
