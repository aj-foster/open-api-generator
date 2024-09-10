defmodule GetListRelationshipsResponseCollection do
  @moduledoc """
  Provides struct and type for a GetListRelationshipsResponseCollection
  """

  @type t :: %__MODULE__{data: [GetListRelationshipsResponseCollectionData.t()]}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{GetListRelationshipsResponseCollectionData, :t}]]
  end
end
