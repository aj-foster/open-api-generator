defmodule AttributionResponseObjectResourceRelationshipsAttributedEvent do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsAttributedEvent
  """

  @type t :: %__MODULE__{
          data: AttributionResponseObjectResourceRelationshipsAttributedEventData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsAttributedEventData, :t}]
  end
end
