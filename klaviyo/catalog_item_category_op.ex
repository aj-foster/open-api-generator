defmodule Klaviyo.CatalogItemCategoryOp do
  @moduledoc """
  Provides struct and type for a CatalogItemCategoryOp
  """

  @type t :: %__MODULE__{data: [Klaviyo.CatalogItemCategoryOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.CatalogItemCategoryOpData, :t}]]
  end
end
