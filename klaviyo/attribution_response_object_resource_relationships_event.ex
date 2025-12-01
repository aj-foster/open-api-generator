defmodule Klaviyo.AttributionResponseObjectResourceRelationshipsEvent do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsEvent
  """

  @type t :: %__MODULE__{
          data: Klaviyo.AttributionResponseObjectResourceRelationshipsEventData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.AttributionResponseObjectResourceRelationshipsEventData, :t}]
  end
end
