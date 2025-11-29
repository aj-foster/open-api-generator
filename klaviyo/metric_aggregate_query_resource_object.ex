defmodule MetricAggregateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a MetricAggregateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: MetricAggregateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {MetricAggregateQueryResourceObjectAttributes, :t},
      type: {:const, "metric-aggregate"}
    ]
  end
end
