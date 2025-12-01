defmodule Klaviyo.CatalogVariantCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogVariantCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogVariantCreateQueryResourceObject, :t}]
  end
end
