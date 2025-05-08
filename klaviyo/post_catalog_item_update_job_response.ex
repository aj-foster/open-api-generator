defmodule PostCatalogItemUpdateJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogItemUpdateJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogItemUpdateJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogItemUpdateJobResponseData, :t}]
  end
end
