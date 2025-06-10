defmodule CatalogCategoryUpdateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQuery
  """

  @type t :: %__MODULE__{data: CatalogCategoryUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogCategoryUpdateQueryResourceObject, :t}]
  end
end
