defmodule CatalogVariantCreateQueryResourceObjectRelationshipsItem do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObjectRelationshipsItem
  """

  @type t :: %__MODULE__{data: CatalogVariantCreateQueryResourceObjectRelationshipsItemData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogVariantCreateQueryResourceObjectRelationshipsItemData, :t}]
  end
end
