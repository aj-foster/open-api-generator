defmodule PostCatalogItemResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogItemResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogItemResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogItemResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogItemResponseDataRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
