defmodule Spotify.PlaylistTrackObject do
  @moduledoc """
  Provides struct and type for a PlaylistTrackObject
  """

  @type t :: %__MODULE__{
          added_at: DateTime.t() | nil,
          added_by: Spotify.PlaylistTrackObjectAddedBy.t() | nil,
          is_local: boolean | nil,
          track: Spotify.EpisodeObject.t() | Spotify.TrackObject.t() | nil
        }

  defstruct [:added_at, :added_by, :is_local, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      added_at: {:string, "date-time"},
      added_by: {Spotify.PlaylistTrackObjectAddedBy, :t},
      is_local: :boolean,
      track: {:union, [{Spotify.EpisodeObject, :t}, {Spotify.TrackObject, :t}]}
    ]
  end
end
