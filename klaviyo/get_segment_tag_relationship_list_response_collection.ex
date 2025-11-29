defmodule GetSegmentTagRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetSegmentTagRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetSegmentTagRelationshipListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetSegmentTagRelationshipListResponseCollectionData, :t}]]
  end
end
