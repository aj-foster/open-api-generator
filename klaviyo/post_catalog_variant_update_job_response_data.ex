defmodule PostCatalogVariantUpdateJobResponseData do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantUpdateJobResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostCatalogVariantUpdateJobResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PostCatalogVariantUpdateJobResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostCatalogVariantUpdateJobResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PostCatalogVariantUpdateJobResponseDataRelationships, :t},
      type: {:const, "catalog-variant-bulk-update-job"}
    ]
  end
end
