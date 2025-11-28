defmodule GetTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: GetTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {GetTagGroupResponseDataRelationshipsTags, :t}]
  end
end
