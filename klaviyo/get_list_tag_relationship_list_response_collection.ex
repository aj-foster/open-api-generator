defmodule GetListTagRelationshipListResponseCollection do
  @moduledoc """
  Provides struct and type for a GetListTagRelationshipListResponseCollection
  """

  @type t :: %__MODULE__{data: [GetListTagRelationshipListResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetListTagRelationshipListResponseCollectionData, :t}]]
  end
end
