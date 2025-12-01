defmodule Klaviyo.PostCatalogItemUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogItemUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogItemUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogItemUpdateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogItemUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-update-job"}
    ]
  end
end
