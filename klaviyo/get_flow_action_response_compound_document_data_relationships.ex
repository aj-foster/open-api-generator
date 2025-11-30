defmodule Klaviyo.GetFlowActionResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          flow: Klaviyo.GetFlowActionResponseCompoundDocumentDataRelationshipsFlow.t() | nil,
          "flow-messages":
            Klaviyo.GetFlowActionResponseCompoundDocumentDataRelationshipsFlowMessages.t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {Klaviyo.GetFlowActionResponseCompoundDocumentDataRelationshipsFlow, :t},
      "flow-messages":
        {Klaviyo.GetFlowActionResponseCompoundDocumentDataRelationshipsFlowMessages, :t}
    ]
  end
end
