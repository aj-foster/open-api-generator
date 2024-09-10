defmodule GetAggregationUnitNameListResponse do
  @moduledoc """
  Provides struct and type for a GetAggregationUnitNameListResponse
  """

  @type t :: %__MODULE__{customAggregationUnits: [String.t()], next: String.t() | nil}

  defstruct [:customAggregationUnits, :next]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [customAggregationUnits: [string: :generic], next: {:string, :generic}]
  end
end
