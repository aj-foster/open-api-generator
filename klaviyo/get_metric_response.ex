defmodule Klaviyo.GetMetricResponse do
  @moduledoc """
  Provides struct and type for a GetMetricResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.MetricResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.MetricResponseObjectResource, :t}]
  end
end
