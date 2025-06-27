defmodule PostCatalogCategoryUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogCategoryUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogCategoryUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogCategoryUpdateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogCategoryUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-update-job"}
    ]
  end
end
