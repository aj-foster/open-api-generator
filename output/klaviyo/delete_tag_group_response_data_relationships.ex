defmodule DeleteTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: DeleteTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {DeleteTagGroupResponseDataRelationshipsTags, :t}]
  end
end
