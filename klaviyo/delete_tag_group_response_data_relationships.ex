defmodule Klaviyo.DeleteTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a DeleteTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: Klaviyo.DeleteTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {Klaviyo.DeleteTagGroupResponseDataRelationshipsTags, :t}]
  end
end
