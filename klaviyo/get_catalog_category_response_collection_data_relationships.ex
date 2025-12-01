defmodule Klaviyo.GetCatalogCategoryResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.GetCatalogCategoryResponseCollectionDataRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.GetCatalogCategoryResponseCollectionDataRelationshipsItems, :t}]
  end
end
