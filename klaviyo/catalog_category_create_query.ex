defmodule Klaviyo.CatalogCategoryCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogCategoryCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogCategoryCreateQueryResourceObject, :t}]
  end
end
