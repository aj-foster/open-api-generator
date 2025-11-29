defmodule CatalogItemCategoryOp do
  @moduledoc """
  Provides struct and type for a CatalogItemCategoryOp
  """

  @type t :: %__MODULE__{data: [CatalogItemCategoryOpData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{CatalogItemCategoryOpData, :t}]]
  end
end
