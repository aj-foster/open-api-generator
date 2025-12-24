defmodule Klaviyo.PostCatalogItemCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogItemCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogItemCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogItemCreateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogItemCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-create-job"}
    ]
  end
end
