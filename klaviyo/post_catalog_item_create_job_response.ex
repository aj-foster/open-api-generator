defmodule PostCatalogItemCreateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogItemCreateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogItemCreateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogItemCreateJobResponseData, :t}]
  end
end
