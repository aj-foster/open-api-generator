defmodule GetCatalogCategoryResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          items: GetCatalogCategoryResponseCollectionDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogCategoryResponseCollectionDataRelationshipsItems, :t}]
  end
end
