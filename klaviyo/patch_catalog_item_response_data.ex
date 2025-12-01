defmodule Klaviyo.PatchCatalogItemResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogItemResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchCatalogItemResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchCatalogItemResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchCatalogItemResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchCatalogItemResponseDataRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
