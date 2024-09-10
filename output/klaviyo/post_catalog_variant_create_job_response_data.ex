defmodule PostCatalogVariantCreateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantCreateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogVariantCreateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogVariantCreateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogVariantCreateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogVariantCreateJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-create-job"}
    ]
  end
end
