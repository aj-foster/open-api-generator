defmodule Klaviyo.PostCatalogCategoryCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogCategoryCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogCategoryCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogCategoryCreateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogCategoryCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-category-bulk-create-job"}
    ]
  end
end
