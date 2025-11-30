defmodule Klaviyo.PostCatalogVariantUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogVariantUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogVariantUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogVariantUpdateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogVariantUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-update-job"}
    ]
  end
end
