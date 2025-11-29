defmodule CatalogItemUpdateQueryResourceObjectRelationshipsCategories do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateQueryResourceObjectRelationshipsCategories
  """

  @type t :: %__MODULE__{
          data: [CatalogItemUpdateQueryResourceObjectRelationshipsCategoriesData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogItemUpdateQueryResourceObjectRelationshipsCategoriesData, :t}]]
  end
end
