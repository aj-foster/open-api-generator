defmodule Klaviyo.GetCatalogVariantResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          item: Klaviyo.GetCatalogVariantResponseCollectionDataRelationshipsItem.t() | nil
        }

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {Klaviyo.GetCatalogVariantResponseCollectionDataRelationshipsItem, :t}]
  end
end
