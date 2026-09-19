defmodule Klaviyo.CatalogVariantCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          item: Klaviyo.CatalogVariantCreateQueryResourceObjectRelationshipsItem.t()
        }

  defstruct [:item]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [item: {Klaviyo.CatalogVariantCreateQueryResourceObjectRelationshipsItem, :t}]
  end
end
