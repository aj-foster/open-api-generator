defmodule GetTagSegmentRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagSegmentRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetTagSegmentRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetTagSegmentRelationshipsResponseCollectionData, :t}]]
  end
end
