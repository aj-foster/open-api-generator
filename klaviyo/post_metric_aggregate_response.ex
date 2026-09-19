defmodule Klaviyo.PostMetricAggregateResponse do
  @moduledoc """
  Provides struct and type for a PostMetricAggregateResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.PostMetricAggregateResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.PostMetricAggregateResponseData, :t}]
  end
end
