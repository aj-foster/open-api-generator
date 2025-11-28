defmodule GetTagGroupTagRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagGroupTagRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetTagGroupTagRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetTagGroupTagRelationshipsResponseCollectionData, :t}]]
  end
end
