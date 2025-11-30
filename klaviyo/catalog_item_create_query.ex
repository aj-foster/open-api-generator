defmodule Klaviyo.CatalogItemCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogItemCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogItemCreateQueryResourceObject, :t}]
  end
end
