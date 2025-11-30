defmodule Klaviyo.BaseEventCreateQueryResourceObjectAttributesMetric do
  @moduledoc """
  Provides struct and type for a BaseEventCreateQueryResourceObjectAttributesMetric
  """

  @type t :: %__MODULE__{data: Klaviyo.MetricCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.MetricCreateQueryResourceObject, :t}]
  end
end
