defmodule Klaviyo.PostCatalogVariantResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponseDataRelationships
  """

  @type t :: %__MODULE__{item: Klaviyo.PostCatalogVariantResponseDataRelationshipsItem.t() | nil}

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {Klaviyo.PostCatalogVariantResponseDataRelationshipsItem, :t}]
  end
end
