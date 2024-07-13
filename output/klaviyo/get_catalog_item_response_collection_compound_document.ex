defmodule GetCatalogItemResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [GetCatalogItemResponseCollectionCompoundDocumentData.t()],
          included: [CatalogVariantResponseObjectResource.t()] | nil,
          links: CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{GetCatalogItemResponseCollectionCompoundDocumentData, :t}],
      included: [{CatalogVariantResponseObjectResource, :t}],
      links: {CollectionLinks, :t}
    ]
  end
end
