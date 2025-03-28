defmodule GetFlowActionResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          flow: GetFlowActionResponseCollectionDataRelationshipsFlow.t() | nil,
          "flow-messages": GetFlowActionResponseCollectionDataRelationshipsFlowMessages.t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {GetFlowActionResponseCollectionDataRelationshipsFlow, :t},
      "flow-messages": {GetFlowActionResponseCollectionDataRelationshipsFlowMessages, :t}
    ]
  end
end
