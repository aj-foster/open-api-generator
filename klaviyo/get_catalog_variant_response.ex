defmodule Klaviyo.GetCatalogVariantResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogVariantResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetCatalogVariantResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetCatalogVariantResponseData, :t}]
  end
end
