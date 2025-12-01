defmodule Klaviyo.PatchCatalogVariantResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCatalogVariantResponseDataRelationships
  """

  @type t :: %__MODULE__{item: Klaviyo.PatchCatalogVariantResponseDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {Klaviyo.PatchCatalogVariantResponseDataRelationshipsItem, :t}]
  end
end
