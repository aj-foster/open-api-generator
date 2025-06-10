defmodule CatalogCategoryCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogCategoryCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogCategoryCreateJobCreateQueryResourceObject, :t}]
  end
end
