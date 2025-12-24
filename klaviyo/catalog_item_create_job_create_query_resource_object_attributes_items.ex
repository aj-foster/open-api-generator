defmodule Klaviyo.CatalogItemCreateJobCreateQueryResourceObjectAttributesItems do
  @moduledoc """
  Provides struct and type for a CatalogItemCreateJobCreateQueryResourceObjectAttributesItems
  """

  @type t :: %__MODULE__{data: [Klaviyo.CatalogItemCreateQueryResourceObject.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{Klaviyo.CatalogItemCreateQueryResourceObject, :t}]]
  end
end
