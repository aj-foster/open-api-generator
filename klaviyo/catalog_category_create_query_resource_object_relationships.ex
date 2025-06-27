defmodule CatalogCategoryCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          items: CatalogCategoryCreateQueryResourceObjectRelationshipsItems.t() | nil
        }

  defstruct [:items]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: {CatalogCategoryCreateQueryResourceObjectRelationshipsItems, :t}]
  end
end
