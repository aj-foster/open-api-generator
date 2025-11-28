defmodule GetFlowActionFlowMessageRelationshipResponseCollection do
  @moduledoc """
  Provides struct and type for a GetFlowActionFlowMessageRelationshipResponseCollection
  """

  @type t :: %__MODULE__{data: [GetFlowActionFlowMessageRelationshipResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetFlowActionFlowMessageRelationshipResponseCollectionData, :t}]]
  end
end
