defmodule Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessage do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationshipsCampaignMessage
  """

  @type t :: %__MODULE__{
          data: Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessageData.t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessageData, :t}]
  end
end
