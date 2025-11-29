defmodule PatchCatalogItemResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchCatalogItemResponseDataRelationships
  """

  @type t :: %__MODULE__{variants: PatchCatalogItemResponseDataRelationshipsVariants.t() | nil}

  defstruct [:variants]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [variants: {PatchCatalogItemResponseDataRelationshipsVariants, :t}]
  end
end
