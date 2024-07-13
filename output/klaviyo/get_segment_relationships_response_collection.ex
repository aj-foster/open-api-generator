defmodule GetSegmentRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetSegmentRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetSegmentRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetSegmentRelationshipsResponseCollectionData, :t}]]
  end
end
