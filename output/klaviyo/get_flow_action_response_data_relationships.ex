defmodule GetFlowActionResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseDataRelationships
  """

  @type t :: %__MODULE__{
          flow: GetFlowActionResponseDataRelationshipsFlow.t() | nil,
          "flow-messages": :"Elixir.GetFlowActionResponseDataRelationshipsFlow-messages".t() | nil
        }

  defstruct [:flow, :"flow-messages"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      flow: {GetFlowActionResponseDataRelationshipsFlow, :t},
      "flow-messages": {:"Elixir.GetFlowActionResponseDataRelationshipsFlow-messages", :t}
    ]
  end
end
