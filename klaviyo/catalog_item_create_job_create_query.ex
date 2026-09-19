defmodule Klaviyo.CatalogItemCreateJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogItemCreateJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogItemCreateJobCreateQueryResourceObject, :t}]
  end
end
