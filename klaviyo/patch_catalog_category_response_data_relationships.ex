defmodule PatchCatalogCategoryResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponseDataRelationships
  """

  @type t :: %__MODULE__{items: PatchCatalogCategoryResponseDataRelationshipsItems.t() | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {PatchCatalogCategoryResponseDataRelationshipsItems, :t}]
  end
end
