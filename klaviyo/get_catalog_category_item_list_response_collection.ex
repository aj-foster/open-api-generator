defmodule Klaviyo.GetCatalogCategoryItemListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryItemListResponseCollection
  """

  @type t :: %__MODULE__{data: [Klaviyo.GetCatalogCategoryItemListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.GetCatalogCategoryItemListResponseCollectionData, :t}]]
  end
end
