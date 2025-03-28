defmodule PostCatalogItemResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogItemResponseDataRelationships
  """

  @type t :: %__MODULE__{variants: PostCatalogItemResponseDataRelationshipsVariants.t() | nil}

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {PostCatalogItemResponseDataRelationshipsVariants, :t}]
  end
end
