defmodule AttributionResponseObjectResourceRelationships do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResourceRelationships
  """

  @type t :: %__MODULE__{
          "attributed-event":
            :"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event".t() | nil,
          campaign: AttributionResponseObjectResourceRelationshipsCampaign.t() | nil,
          "campaign-message":
            :"Elixir.AttributionResponseObjectResourceRelationshipsCampaign-message".t() | nil,
          event: AttributionResponseObjectResourceRelationshipsEvent.t() | nil,
          flow: AttributionResponseObjectResourceRelationshipsFlow.t() | nil,
          "flow-message":
            :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message".t() | nil,
          "flow-message-variation":
            :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation".t()
            | nil
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
        {:"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event", :t},
      campaign: {AttributionResponseObjectResourceRelationshipsCampaign, :t},
      "campaign-message":
        {:"Elixir.AttributionResponseObjectResourceRelationshipsCampaign-message", :t},
      event: {AttributionResponseObjectResourceRelationshipsEvent, :t},
      flow: {AttributionResponseObjectResourceRelationshipsFlow, :t},
      "flow-message": {:"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message", :t},
      "flow-message-variation":
        {:"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation", :t}
    ]
  end
end
