defmodule CatalogItemUpdateQuery do
  @moduledoc """
  Provides struct and type for a CatalogItemUpdateQuery
  """

  @type t :: %__MODULE__{data: CatalogItemUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {CatalogItemUpdateQueryResourceObject, :t}]
  end
end
