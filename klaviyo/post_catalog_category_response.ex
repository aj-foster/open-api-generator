defmodule PostCatalogCategoryResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryResponse
  """

  @type t :: %__MODULE__{data: PostCatalogCategoryResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogCategoryResponseData, :t}]
  end
end
