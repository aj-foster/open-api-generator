defmodule PostCatalogCategoryResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryResponseDataRelationships
  """

  @type t :: %__MODULE__{items: PostCatalogCategoryResponseDataRelationshipsItems.t() | nil}

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {PostCatalogCategoryResponseDataRelationshipsItems, :t}]
  end
end
