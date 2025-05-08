defmodule GetFlowResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions": GetFlowResponseCompoundDocumentDataRelationshipsFlowActions.t() | nil,
          tags: GetFlowResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions": {GetFlowResponseCompoundDocumentDataRelationshipsFlowActions, :t},
      tags: {GetFlowResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
