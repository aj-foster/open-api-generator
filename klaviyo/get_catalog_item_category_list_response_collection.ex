defmodule Klaviyo.GetCatalogItemCategoryListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCatalogItemCategoryListResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetCatalogItemCategoryListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetCatalogItemCategoryListResponseCollectionData, :t}]]
  end
end
