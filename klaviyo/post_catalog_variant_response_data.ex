defmodule Klaviyo.PostCatalogVariantResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogVariantResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogVariantResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogVariantResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogVariantResponseDataRelationships, :t},
      type: {:const, "catalog-variant"}
    ]
  end
end
