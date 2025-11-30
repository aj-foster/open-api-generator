defmodule Klaviyo.PatchCatalogVariantResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogVariantResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCatalogVariantResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCatalogVariantResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCatalogVariantResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCatalogVariantResponseDataRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
