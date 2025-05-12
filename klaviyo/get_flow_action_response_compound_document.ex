defmodule GetFlowActionResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowActionResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetFlowActionResponseCompoundDocumentData.t(),
          included: [FlowMessageResponseObjectResource.t() | FlowResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetFlowActionResponseCompoundDocumentData, :t},
      included: [
        union: [{FlowMessageResponseObjectResource, :t}, {FlowResponseObjectResource, :t}]
      ]
    ]
  end
end
