defmodule GetEventMetricsRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetEventMetricsRelationshipListResponse
  """

  @type t :: %__MODULE__{data: GetEventMetricsRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {GetEventMetricsRelationshipListResponseData, :t}]
  end
end
