defmodule PatchCatalogVariantResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogVariantResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCatalogVariantResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCatalogVariantResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCatalogVariantResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCatalogVariantResponseDataRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
