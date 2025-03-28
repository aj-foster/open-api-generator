defmodule GetTagListRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetTagListRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetTagListRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetTagListRelationshipsResponseCollectionData, :t}]]
  end
end
