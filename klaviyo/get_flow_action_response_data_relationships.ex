defmodule Klaviyo.GetFlowActionResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseDataRelationships
  """

  @type t :: %__MODULE__{
          flow: Klaviyo.GetFlowActionResponseDataRelationshipsFlow.t() | nil,
          "flow-messages": Klaviyo.GetFlowActionResponseDataRelationshipsFlowMessages.t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {Klaviyo.GetFlowActionResponseDataRelationshipsFlow, :t},
      "flow-messages": {Klaviyo.GetFlowActionResponseDataRelationshipsFlowMessages, :t}
    ]
  end
end
