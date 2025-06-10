defmodule CatalogVariantUpdateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogVariantUpdateJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogVariantUpdateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogVariantUpdateJobCreateQueryResourceObject, :t}]
  end
end
