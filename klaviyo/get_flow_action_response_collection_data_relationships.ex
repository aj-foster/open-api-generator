defmodule Klaviyo.GetFlowActionResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          flow: Klaviyo.GetFlowActionResponseCollectionDataRelationshipsFlow.t() | nil,
          "flow-messages":
            Klaviyo.GetFlowActionResponseCollectionDataRelationshipsFlowMessages.t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {Klaviyo.GetFlowActionResponseCollectionDataRelationshipsFlow, :t},
      "flow-messages": {Klaviyo.GetFlowActionResponseCollectionDataRelationshipsFlowMessages, :t}
    ]
  end
end
