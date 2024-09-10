defmodule GetFlowResponseCollectionCompoundDocumentDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseCollectionCompoundDocumentDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions":
            :"Elixir.GetFlowResponseCollectionCompoundDocumentDataRelationshipsFlow-actions".t()
            | nil,
          tags: GetFlowResponseCollectionCompoundDocumentDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions":
        {:"Elixir.GetFlowResponseCollectionCompoundDocumentDataRelationshipsFlow-actions", :t},
      tags: {GetFlowResponseCollectionCompoundDocumentDataRelationshipsTags, :t}
    ]
  end
end
