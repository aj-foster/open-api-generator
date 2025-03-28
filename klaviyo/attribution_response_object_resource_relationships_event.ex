defmodule AttributionResponseObjectResourceRelationshipsEvent do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsEvent
  """

  @type t :: %__MODULE__{data: AttributionResponseObjectResourceRelationshipsEventData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsEventData, :t}]
  end
end
