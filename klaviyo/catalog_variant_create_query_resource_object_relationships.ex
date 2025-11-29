defmodule CatalogVariantCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{item: CatalogVariantCreateQueryResourceObjectRelationshipsItem.t()}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {CatalogVariantCreateQueryResourceObjectRelationshipsItem, :t}]
  end
end
