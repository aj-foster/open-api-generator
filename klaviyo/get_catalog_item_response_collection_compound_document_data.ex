defmodule Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetCatalogItemResponseCollectionCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships:
        {Klaviyo.GetCatalogItemResponseCollectionCompoundDocumentDataRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
