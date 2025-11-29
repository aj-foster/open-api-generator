defmodule AttributionResponseObjectResourceRelationships do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationships
  """

  @type t :: %__MODULE__{
          "attributed-event":
            AttributionResponseObjectResourceRelationshipsAttributedEvent.t() | nil,
          campaign: AttributionResponseObjectResourceRelationshipsCampaign.t() | nil,
          "campaign-message":
            AttributionResponseObjectResourceRelationshipsCampaignMessage.t() | nil,
          event: AttributionResponseObjectResourceRelationshipsEvent.t() | nil,
          flow: AttributionResponseObjectResourceRelationshipsFlow.t() | nil,
          "flow-message": AttributionResponseObjectResourceRelationshipsFlowMessage.t() | nil,
          "flow-message-variation":
            AttributionResponseObjectResourceRelationshipsFlowMessageVariation.t() | nil
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
      "attributed-event": {AttributionResponseObjectResourceRelationshipsAttributedEvent, :t},
      campaign: {AttributionResponseObjectResourceRelationshipsCampaign, :t},
      "campaign-message": {AttributionResponseObjectResourceRelationshipsCampaignMessage, :t},
      event: {AttributionResponseObjectResourceRelationshipsEvent, :t},
      flow: {AttributionResponseObjectResourceRelationshipsFlow, :t},
      "flow-message": {AttributionResponseObjectResourceRelationshipsFlowMessage, :t},
      "flow-message-variation":
        {AttributionResponseObjectResourceRelationshipsFlowMessageVariation, :t}
    ]
  end
end
