defmodule Klaviyo.PostCatalogVariantCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostCatalogVariantCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostCatalogVariantCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostCatalogVariantCreateJobResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostCatalogVariantCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-create-job"}
    ]
  end
end
