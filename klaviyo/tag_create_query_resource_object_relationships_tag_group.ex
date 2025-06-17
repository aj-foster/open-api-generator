defmodule TagCreateQueryResourceObjectRelationshipsTagGroup do
  @moduledoc """
  Provides struct and type for a TagCreateQueryResourceObjectRelationshipsTagGroup
  """

  @type t :: %__MODULE__{data: TagCreateQueryResourceObjectRelationshipsTagGroupData.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TagCreateQueryResourceObjectRelationshipsTagGroupData, :t}]
  end
end
