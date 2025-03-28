defmodule GetCatalogVariantResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantResponseDataRelationships
  """

  @type t :: %__MODULE__{item: GetCatalogVariantResponseDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {GetCatalogVariantResponseDataRelationshipsItem, :t}]
  end
end
