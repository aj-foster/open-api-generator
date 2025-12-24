defmodule Klaviyo.MetricAggregateRowDTO do
  @moduledoc """
  Provides struct and type for a MetricAggregateRowDTO
  """

  @type t :: %__MODULE__{dimensions: [String.t()], measurements: map}

  defstruct [:dimensions, :measurements]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [dimensions: [:string], measurements: :map]
  end
end
