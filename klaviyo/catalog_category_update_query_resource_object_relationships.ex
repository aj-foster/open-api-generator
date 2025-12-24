defmodule Klaviyo.CatalogCategoryUpdateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          items: Klaviyo.CatalogCategoryUpdateQueryResourceObjectRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {Klaviyo.CatalogCategoryUpdateQueryResourceObjectRelationshipsItems, :t}]
  end
end
