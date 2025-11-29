defmodule PostCatalogCategoryUpdateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryUpdateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogCategoryUpdateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogCategoryUpdateJobResponseData, :t}]
  end
end
