defmodule :"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action" do
  @moduledoc """
  Provides struct and type for a :"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action"
  """

  @type t :: %__MODULE__{
          data:
            :"Elixir.:\"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action\"Data".t(),
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {:"Elixir.:\"Elixir.GetFlowMessageResponseCompoundDocumentDataRelationshipsFlow-action\"Data",
         :t},
      links: {RelationshipLinks, :t}
    ]
  end
end
