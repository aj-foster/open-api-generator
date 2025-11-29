defmodule CatalogCategoryUpdateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogCategoryUpdateJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogCategoryUpdateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogCategoryUpdateJobCreateQueryResourceObject, :t}]
  end
end
