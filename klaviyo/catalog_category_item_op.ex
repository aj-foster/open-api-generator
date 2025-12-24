defmodule Klaviyo.CatalogCategoryItemOp do
  @moduledoc """
  Provides struct and type for a CatalogCategoryItemOp
  """

  @type t :: %__MODULE__{data: [Klaviyo.CatalogCategoryItemOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.CatalogCategoryItemOpData, :t}]]
  end
end
