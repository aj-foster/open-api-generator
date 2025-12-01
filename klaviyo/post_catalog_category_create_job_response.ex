defmodule Klaviyo.PostCatalogCategoryCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogCategoryCreateJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogCategoryCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogCategoryCreateJobResponseData, :t}]
  end
end
