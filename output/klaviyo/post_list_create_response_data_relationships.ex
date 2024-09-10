defmodule PostListCreateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostListCreateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: PostListCreateResponseDataRelationshipsProfiles.t() | nil,
          tags: PostListCreateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {PostListCreateResponseDataRelationshipsProfiles, :t},
      tags: {PostListCreateResponseDataRelationshipsTags, :t}
    ]
  end
end
