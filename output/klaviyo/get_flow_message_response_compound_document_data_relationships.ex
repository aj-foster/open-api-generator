defmodule GetFlowMessageResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-action":
            :"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action".t() | nil,
          template: GetFlowMessageResponseCompoundDocumentDataRelationshipsTemplate.t() | nil
        }

  defstruct [:"flow-action", :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-action":
        {:"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action", :t},
      template: {GetFlowMessageResponseCompoundDocumentDataRelationshipsTemplate, :t}
    ]
  end
end
