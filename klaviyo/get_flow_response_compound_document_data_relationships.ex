defmodule Klaviyo.GetFlowResponseCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions":
            Klaviyo.GetFlowResponseCompoundDocumentDataRelationshipsFlowActions.t() | nil,
          tags: Klaviyo.GetFlowResponseCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions": {Klaviyo.GetFlowResponseCompoundDocumentDataRelationshipsFlowActions, :t},
      tags: {Klaviyo.GetFlowResponseCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
