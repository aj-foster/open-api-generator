defmodule GetAggregationUnitUsageResponse do
  @moduledoc """
  Provides struct and type for a GetAggregationUnitUsageResponse
  """

  @type t :: %__MODULE__{numOfCustomAggregationUnits: integer}

  defstruct [:numOfCustomAggregationUnits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [numOfCustomAggregationUnits: :integer]
  end
end
