defmodule GetFlowTagRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetFlowTagRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetFlowTagRelationshipListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetFlowTagRelationshipListResponseCollectionData, :t}]]
  end
end
