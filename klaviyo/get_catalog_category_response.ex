defmodule GetCatalogCategoryResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryResponse
  """

  @type t :: %__MODULE__{data: GetCatalogCategoryResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCatalogCategoryResponseData, :t}]
  end
end
