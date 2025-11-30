defmodule Klaviyo.PostCatalogItemCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogItemCreateJobResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostCatalogItemCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostCatalogItemCreateJobResponseData, :t}]
  end
end
