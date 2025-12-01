defmodule Klaviyo.GetCatalogItemResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentData.t()],
          included: [Klaviyo.CatalogVariantResponseObjectResource.t()] | nil,
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :included, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentData, :t}],
      included: [{Klaviyo.CatalogVariantResponseObjectResource, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
