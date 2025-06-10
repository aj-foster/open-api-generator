defmodule GetTagFlowRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagFlowRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetTagFlowRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetTagFlowRelationshipsResponseCollectionData, :t}]]
  end
end
