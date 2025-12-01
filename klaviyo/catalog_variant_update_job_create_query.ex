defmodule Klaviyo.CatalogVariantUpdateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogVariantUpdateJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogVariantUpdateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogVariantUpdateJobCreateQueryResourceObject, :t}]
  end
end
