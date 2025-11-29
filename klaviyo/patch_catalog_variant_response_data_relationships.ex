defmodule PatchCatalogVariantResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCatalogVariantResponseDataRelationships
  """

  @type t :: %__MODULE__{item: PatchCatalogVariantResponseDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {PatchCatalogVariantResponseDataRelationshipsItem, :t}]
  end
end
