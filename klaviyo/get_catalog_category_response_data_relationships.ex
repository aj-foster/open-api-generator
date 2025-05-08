defmodule GetCatalogCategoryResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponseDataRelationships
  """

  @type t :: %__MODULE__{items: GetCatalogCategoryResponseDataRelationshipsItems.t() | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {GetCatalogCategoryResponseDataRelationshipsItems, :t}]
  end
end
