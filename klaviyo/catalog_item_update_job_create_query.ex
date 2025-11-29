defmodule CatalogItemUpdateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateJobCreateQuery
  """

  @type t :: %__MODULE__{data: CatalogItemUpdateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogItemUpdateJobCreateQueryResourceObject, :t}]
  end
end
