defmodule PostCatalogVariantResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponseDataRelationships
  """

  @type t :: %__MODULE__{item: PostCatalogVariantResponseDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {PostCatalogVariantResponseDataRelationshipsItem, :t}]
  end
end
