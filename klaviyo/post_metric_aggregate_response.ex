defmodule PostMetricAggregateResponse do
  @moduledoc """
  Provides struct and type for a PostMetricAggregateResponse
  """

  @type t :: %__MODULE__{data: PostMetricAggregateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {PostMetricAggregateResponseData, :t}]
  end
end
