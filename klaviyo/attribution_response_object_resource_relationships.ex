defmodule Klaviyo.AttributionResponseObjectResourceRelationships do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationships
  """

  @type t :: %__MODULE__{
          "attributed-event":
            Klaviyo.AttributionResponseObjectResourceRelationshipsAttributedEvent.t() | nil,
          campaign: Klaviyo.AttributionResponseObjectResourceRelationshipsCampaign.t() | nil,
          "campaign-message":
            Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessage.t() | nil,
          event: Klaviyo.AttributionResponseObjectResourceRelationshipsEvent.t() | nil,
          flow: Klaviyo.AttributionResponseObjectResourceRelationshipsFlow.t() | nil,
          "flow-message":
            Klaviyo.AttributionResponseObjectResourceRelationshipsFlowMessage.t() | nil,
          "flow-message-variation":
            Klaviyo.AttributionResponseObjectResourceRelationshipsFlowMessageVariation.t() | nil
        }

  defstruct [
    :"attributed-event",
    :campaign,
    :"campaign-message",
    :event,
    :flow,
    :"flow-message",
    :"flow-message-variation"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "attributed-event":
        {Klaviyo.AttributionResponseObjectResourceRelationshipsAttributedEvent, :t},
      campaign: {Klaviyo.AttributionResponseObjectResourceRelationshipsCampaign, :t},
      "campaign-message":
        {Klaviyo.AttributionResponseObjectResourceRelationshipsCampaignMessage, :t},
      event: {Klaviyo.AttributionResponseObjectResourceRelationshipsEvent, :t},
      flow: {Klaviyo.AttributionResponseObjectResourceRelationshipsFlow, :t},
      "flow-message": {Klaviyo.AttributionResponseObjectResourceRelationshipsFlowMessage, :t},
      "flow-message-variation":
        {Klaviyo.AttributionResponseObjectResourceRelationshipsFlowMessageVariation, :t}
    ]
  end
end
