defmodule PatchCatalogItemResponseData do
  @moduledoc """
  Provides struct and type for a PatchCatalogItemResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchCatalogItemResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchCatalogItemResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchCatalogItemResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchCatalogItemResponseDataRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
