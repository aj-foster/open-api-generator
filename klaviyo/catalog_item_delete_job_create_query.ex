defmodule Klaviyo.CatalogItemDeleteJobCreateQuery do
  @moduledoc """
  Provides struct and type for a CatalogItemDeleteJobCreateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.CatalogItemDeleteJobCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.CatalogItemDeleteJobCreateQueryResourceObject, :t}]
  end
end
