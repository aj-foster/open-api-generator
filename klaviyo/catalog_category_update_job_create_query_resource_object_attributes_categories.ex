defmodule CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateJobCreateQueryResourceObjectAttributesCategories
  """

  @type t :: %__MODULE__{data: [CatalogCategoryUpdateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogCategoryUpdateQueryResourceObject, :t}]]
  end
end
