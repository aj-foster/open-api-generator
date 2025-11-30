defmodule Klaviyo.GetFlowResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions":
            Klaviyo.GetFlowResponseCollectionCompoundDocumentDataRelationshipsFlowActions.t()
            | nil,
          tags: Klaviyo.GetFlowResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions":
        {Klaviyo.GetFlowResponseCollectionCompoundDocumentDataRelationshipsFlowActions, :t},
      tags: {Klaviyo.GetFlowResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
