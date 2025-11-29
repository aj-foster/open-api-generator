defmodule PostCatalogItemDeleteJobResponse do
  @moduledoc """
  Provides struct and type for a PostCatalogItemDeleteJobResponse
  """

  @type t :: %__MODULE__{data: PostCatalogItemDeleteJobResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostCatalogItemDeleteJobResponseData, :t}]
  end
end
