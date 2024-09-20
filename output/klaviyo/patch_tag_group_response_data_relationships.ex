defmodule PatchTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: PatchTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {PatchTagGroupResponseDataRelationshipsTags, :t}]
  end
end
