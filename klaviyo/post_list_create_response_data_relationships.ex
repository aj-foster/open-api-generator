defmodule Klaviyo.PostListCreateResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a PostListCreateResponseDataRelationships
  """

  @type t :: %__MODULE__{
          profiles: Klaviyo.PostListCreateResponseDataRelationshipsProfiles.t() | nil,
          tags: Klaviyo.PostListCreateResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:profiles, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      profiles: {Klaviyo.PostListCreateResponseDataRelationshipsProfiles, :t},
      tags: {Klaviyo.PostListCreateResponseDataRelationshipsTags, :t}
    ]
  end
end
