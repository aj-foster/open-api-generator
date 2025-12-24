defmodule Klaviyo.PostCatalogItemResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogItemResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogItemResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogItemResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogItemResponseDataRelationships, :t},
      type: {:const, "catalog-item"}
    ]
  end
end
