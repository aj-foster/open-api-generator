defmodule Klaviyo.GetTagGroupResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetTagGroupResponseDataRelationships
  """

  @type t :: %__MODULE__{tags: Klaviyo.GetTagGroupResponseDataRelationshipsTags.t() | nil}

  defstruct [:tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [tags: {Klaviyo.GetTagGroupResponseDataRelationshipsTags, :t}]
  end
end
