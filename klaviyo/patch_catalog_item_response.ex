defmodule Klaviyo.PatchCatalogItemResponse do
  @moduledoc """
  Provides struct and type for a PatchCatalogItemResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PatchCatalogItemResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PatchCatalogItemResponseData, :t}]
  end
end
