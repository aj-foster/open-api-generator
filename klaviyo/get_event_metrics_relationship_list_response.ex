defmodule Klaviyo.GetEventMetricsRelationshipListResponse do
  @moduledoc """
  Provides struct and type for a GetEventMetricsRelationshipListResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.GetEventMetricsRelationshipListResponseData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.GetEventMetricsRelationshipListResponseData, :t}]
  end
end
