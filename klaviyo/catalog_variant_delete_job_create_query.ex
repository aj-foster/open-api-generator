defmodule CatalogVariantDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogVariantDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogVariantDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogVariantDeleteJobCreateQueryResourceObject, :t}]
  end
end
