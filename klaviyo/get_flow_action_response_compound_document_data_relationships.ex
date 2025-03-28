defmodule GetFlowActionResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          flow: GetFlowActionResponseCompoundDocumentDataRelationshipsFlow.t() | nil,
          "flow-messages":
            GetFlowActionResponseCompoundDocumentDataRelationshipsFlowMessages.t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {GetFlowActionResponseCompoundDocumentDataRelationshipsFlow, :t},
      "flow-messages": {GetFlowActionResponseCompoundDocumentDataRelationshipsFlowMessages, :t}
    ]
  end
end
