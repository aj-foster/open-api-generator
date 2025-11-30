defmodule Klaviyo.PatchCatalogCategoryResponseDataRelationshipsItems do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponseDataRelationshipsItems
  """

  @type t :: %__MODULE__{
          data: [Klaviyo.PatchCatalogCategoryResponseDataRelationshipsItemsData.t()],
          links: Klaviyo.RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{Klaviyo.PatchCatalogCategoryResponseDataRelationshipsItemsData, :t}],
      links: {Klaviyo.RelationshipLinks, :t}
    ]
  end
end
