defmodule PatchCatalogCategoryResponse do
  @moduledoc """
  Provides struct and type for a PatchCatalogCategoryResponse
  """

  @type t :: %__MODULE__{data: PatchCatalogCategoryResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PatchCatalogCategoryResponseData, :t}]
  end
end
