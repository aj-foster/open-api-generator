defmodule GetFlowResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetFlowResponseCompoundDocumentData.t(),
          included: [FlowActionResponseObjectResource.t() | TagResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetFlowResponseCompoundDocumentData, :t},
      included: [union: [{FlowActionResponseObjectResource, :t}, {TagResponseObjectResource, :t}]]
    ]
  end
end
