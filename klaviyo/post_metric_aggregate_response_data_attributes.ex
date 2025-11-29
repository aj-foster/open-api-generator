defmodule PostMetricAggregateResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostMetricAggregateResponseDataAttributes
  """

  @type t :: %__MODULE__{data: [MetricAggregateRowDTO.t()], dates: [DateTime.t()]}

  defstruct [:data, :dates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{MetricAggregateRowDTO, :t}], dates: [string: :date_time]]
  end
end
