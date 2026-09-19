defmodule Klaviyo.PostCatalogItemDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogItemDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogItemDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogItemDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogItemDeleteJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogItemDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-item-bulk-delete-job"}
    ]
  end
end
