defmodule GetCatalogItemCategoryListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCategoryListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetCatalogItemCategoryListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetCatalogItemCategoryListResponseCollectionData, :t}]]
  end
end
