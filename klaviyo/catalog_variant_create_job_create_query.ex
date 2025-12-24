defmodule Klaviyo.CatalogVariantCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogVariantCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogVariantCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogVariantCreateJobCreateQueryResourceObject, :t}]
  end
end
