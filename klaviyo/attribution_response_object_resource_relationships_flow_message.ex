defmodule AttributionResponseObjectResourceRelationshipsFlowMessage do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsFlowMessage
  """

  @type t :: %__MODULE__{data: AttributionResponseObjectResourceRelationshipsFlowMessageData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsFlowMessageData, :t}]
  end
end
