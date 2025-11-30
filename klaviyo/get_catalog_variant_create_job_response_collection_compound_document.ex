defmodule Klaviyo.GetCatalogVariantCreateJobResponseCollectionCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCollectionCompoundDocument
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.GetCatalogVariantCreateJobResponseCollectionCompoundDocumentData.t()],
          links: Klaviyo.CollectionLinks.t()
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.GetCatalogVariantCreateJobResponseCollectionCompoundDocumentData, :t}],
      links: {Klaviyo.CollectionLinks, :t}
    ]
  end
end
