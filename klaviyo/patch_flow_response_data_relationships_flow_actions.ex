defmodule PatchFlowResponseDataRelationshipsFlowActions do
  @moduledoc """
  Provides struct and type for a PatchFlowResponseDataRelationshipsFlowActions
  """

  @type t :: %__MODULE__{
          data: [PatchFlowResponseDataRelationshipsFlowActionsData.t()],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [{PatchFlowResponseDataRelationshipsFlowActionsData, :t}],
      links: {RelationshipLinks, :t}
    ]
  end
end
