defmodule AttributionResponseObjectResourceRelationshipsCampaignMessage do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsCampaignMessage
  """

  @type t :: %__MODULE__{
          data: AttributionResponseObjectResourceRelationshipsCampaignMessageData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {AttributionResponseObjectResourceRelationshipsCampaignMessageData, :t}]
  end
end
