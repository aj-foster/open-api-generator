defmodule CatalogItemCreateQueryResourceObjectRelationshipsCategories do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateQueryResourceObjectRelationshipsCategories
  """

  @type t :: %__MODULE__{
          data: [CatalogItemCreateQueryResourceObjectRelationshipsCategoriesData.t()]
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogItemCreateQueryResourceObjectRelationshipsCategoriesData, :t}]]
  end
end
