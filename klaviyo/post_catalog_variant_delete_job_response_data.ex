defmodule PostCatalogVariantDeleteJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantDeleteJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogVariantDeleteJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogVariantDeleteJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogVariantDeleteJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogVariantDeleteJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-delete-job"}
    ]
  end
end
