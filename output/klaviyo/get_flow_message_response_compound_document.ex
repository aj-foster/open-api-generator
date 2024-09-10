defmodule GetFlowMessageResponseCompoundDocument do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCompoundDocument
  """

  @type t :: %__MODULE__{
          data: GetFlowMessageResponseCompoundDocumentData.t(),
          included:
            [FlowActionResponseObjectResource.t() | TemplateResponseObjectResource.t()] | nil
        }

  defstruct [:data, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {GetFlowMessageResponseCompoundDocumentData, :t},
      included: [
        union: [{FlowActionResponseObjectResource, :t}, {TemplateResponseObjectResource, :t}]
      ]
    ]
  end
end
