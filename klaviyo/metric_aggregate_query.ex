defmodule MetricAggregateQuery do
  @moduledoc """
  Provides struct and type for a MetricAggregateQuery
  """

  @type t :: %__MODULE__{data: MetricAggregateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {MetricAggregateQueryResourceObject, :t}]
  end
end
