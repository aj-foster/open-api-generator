defmodule Klaviyo.PostTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: Klaviyo.PostTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {Klaviyo.PostTagGroupResponseDataRelationshipsTags, :t}]
  end
end
