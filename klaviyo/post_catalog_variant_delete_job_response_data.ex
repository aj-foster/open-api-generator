defmodule Klaviyo.PostCatalogVariantDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogVariantDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogVariantDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogVariantDeleteJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogVariantDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-delete-job"}
    ]
  end
end
