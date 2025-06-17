defmodule GetMetricResponseCollection do
  @moduledoc """
  Provides struct and type for a GetMetricResponseCollection
  """

  @type t :: %__MODULE__{data: [MetricResponseObjectResource.t()], links: CollectionLinks.t()}

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{MetricResponseObjectResource, :t}], links: {CollectionLinks, :t}]
  end
end
