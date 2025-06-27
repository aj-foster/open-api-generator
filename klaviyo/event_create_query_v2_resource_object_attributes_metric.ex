defmodule EventCreateQueryV2ResourceObjectAttributesMetric do
  @moduledoc """
  Provides struct and type for a EventCreateQueryV2ResourceObjectAttributesMetric
  """

  @type t :: %__MODULE__{data: MetricCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {MetricCreateQueryResourceObject, :t}]
  end
end
