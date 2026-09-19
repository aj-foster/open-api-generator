defmodule Klaviyo.PostCatalogCategoryDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryDeleteJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogCategoryDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogCategoryDeleteJobResponseData, :t}]
  end
end
