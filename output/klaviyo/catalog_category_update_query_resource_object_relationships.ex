defmodule CatalogCategoryUpdateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          items: CatalogCategoryUpdateQueryResourceObjectRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {CatalogCategoryUpdateQueryResourceObjectRelationshipsItems, :t}]
  end
end
