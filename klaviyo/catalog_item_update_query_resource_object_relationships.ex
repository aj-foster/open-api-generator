defmodule CatalogItemUpdateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          categories: CatalogItemUpdateQueryResourceObjectRelationshipsCategories.t() | nil
        }

  defstruct [:categories]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [categories: {CatalogItemUpdateQueryResourceObjectRelationshipsCategories, :t}]
  end
end
