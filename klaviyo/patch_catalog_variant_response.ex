defmodule PatchCatalogVariantResponse do
  @moduledoc """
  Provides struct and type for a PatchCatalogVariantResponse
  """

  @type t :: %__MODULE__{data: PatchCatalogVariantResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchCatalogVariantResponseData, :t}]
  end
end
