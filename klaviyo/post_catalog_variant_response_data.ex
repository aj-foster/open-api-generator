defmodule PostCatalogVariantResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogVariantResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogVariantResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogVariantResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogVariantResponseDataRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
