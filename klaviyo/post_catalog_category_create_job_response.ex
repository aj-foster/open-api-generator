defmodule PostCatalogCategoryCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryCreateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogCategoryCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogCategoryCreateJobResponseData, :t}]
  end
end
