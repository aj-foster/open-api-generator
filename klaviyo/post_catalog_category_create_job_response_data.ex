defmodule PostCatalogCategoryCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogCategoryCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogCategoryCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogCategoryCreateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogCategoryCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-create-job"}
    ]
  end
end
