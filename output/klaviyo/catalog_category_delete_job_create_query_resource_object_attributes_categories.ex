defmodule CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories do
  @moduledoc """
  Provides struct and type for a CatalogCategoryDeleteJobCreateQueryResourceObjectAttributesCategories
  """

  @type t :: %__MODULE__{data: [CatalogCategoryDeleteQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogCategoryDeleteQueryResourceObject, :t}]]
  end
end
