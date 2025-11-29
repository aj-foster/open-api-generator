defmodule GetCatalogVariantResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{item: GetCatalogVariantResponseCollectionDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {GetCatalogVariantResponseCollectionDataRelationshipsItem, :t}]
  end
end
