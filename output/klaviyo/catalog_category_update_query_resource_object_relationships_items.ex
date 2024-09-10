defmodule CatalogCategoryUpdateQueryResourceObjectRelationshipsItems do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQueryResourceObjectRelationshipsItems
  """

  @type t :: %__MODULE__{
          data: [CatalogCategoryUpdateQueryResourceObjectRelationshipsItemsData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogCategoryUpdateQueryResourceObjectRelationshipsItemsData, :t}]]
  end
end
