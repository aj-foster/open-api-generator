defmodule Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantCreateJobResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships:
        {Klaviyo.GetCatalogVariantCreateJobResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-create-job"}
    ]
  end
end
