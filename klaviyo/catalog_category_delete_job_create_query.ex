defmodule CatalogCategoryDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogCategoryDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogCategoryDeleteJobCreateQueryResourceObject, :t}]
  end
end
