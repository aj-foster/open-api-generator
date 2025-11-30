defmodule Klaviyo.CatalogCategoryUpdateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogCategoryUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogCategoryUpdateQueryResourceObject, :t}]
  end
end
