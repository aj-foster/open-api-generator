defmodule Klaviyo.PostCatalogVariantResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogVariantResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogVariantResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogVariantResponseData, :t}]
  end
end
