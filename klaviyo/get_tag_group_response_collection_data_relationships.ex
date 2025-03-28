defmodule GetTagGroupResponseCollectionDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagGroupResponseCollectionDataRelationships
  """

  @type t :: %__MODULE__{tags: GetTagGroupResponseCollectionDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {GetTagGroupResponseCollectionDataRelationshipsTags, :t}]
  end
end
