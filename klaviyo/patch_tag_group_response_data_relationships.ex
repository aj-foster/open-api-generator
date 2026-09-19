defmodule Klaviyo.PatchTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PatchTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: Klaviyo.PatchTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {Klaviyo.PatchTagGroupResponseDataRelationshipsTags, :t}]
  end
end
