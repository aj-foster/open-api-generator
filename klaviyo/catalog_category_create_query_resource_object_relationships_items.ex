defmodule CatalogCategoryCreateQueryResourceObjectRelationshipsItems do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQueryResourceObjectRelationshipsItems
  """

  @type t :: %__MODULE__{
          data: [CatalogCategoryCreateQueryResourceObjectRelationshipsItemsData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogCategoryCreateQueryResourceObjectRelationshipsItemsData, :t}]]
  end
end
