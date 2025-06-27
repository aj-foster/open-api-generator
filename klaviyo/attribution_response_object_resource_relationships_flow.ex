defmodule AttributionResponseObjectResourceRelationshipsFlow do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsFlow
  """

  @type t :: %__MODULE__{data: AttributionResponseObjectResourceRelationshipsFlowData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsFlowData, :t}]
  end
end
