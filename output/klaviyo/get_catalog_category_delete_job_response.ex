defmodule GetCatalogCategoryDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a GetCatalogCategoryDeleteJobResponse
  """

  @type t :: %__MODULE__{data: GetCatalogCategoryDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetCatalogCategoryDeleteJobResponseData, :t}]
  end
end
