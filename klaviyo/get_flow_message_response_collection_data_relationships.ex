defmodule GetFlowMessageResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-action": GetFlowMessageResponseCollectionDataRelationshipsFlowAction.t() | nil,
          template: GetFlowMessageResponseCollectionDataRelationshipsTemplate.t() | nil
        }

  defstruct [:"flow-action", :template]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-action": {GetFlowMessageResponseCollectionDataRelationshipsFlowAction, :t},
      template: {GetFlowMessageResponseCollectionDataRelationshipsTemplate, :t}
    ]
  end
end
