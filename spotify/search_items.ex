defmodule Spotify.SearchItems do
  @moduledoc """
  Provides struct and type for a SearchItems
  """

  @type json_resp :: %__MODULE__{
          albums: Spotify.PagingSimplifiedAlbumObject.t() | nil,
          artists: Spotify.PagingArtistObject.t() | nil,
          audiobooks: Spotify.PagingSimplifiedAudiobookObject.t() | nil,
          episodes: Spotify.PagingSimplifiedEpisodeObject.t() | nil,
          playlists: Spotify.PagingPlaylistObject.t() | nil,
          shows: Spotify.PagingSimplifiedShowObject.t() | nil,
          tracks: Spotify.PagingTrackObject.t() | nil
        }

  defstruct [:albums, :artists, :audiobooks, :episodes, :playlists, :shows, :tracks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      albums: {Spotify.PagingSimplifiedAlbumObject, :t},
      artists: {Spotify.PagingArtistObject, :t},
      audiobooks: {Spotify.PagingSimplifiedAudiobookObject, :t},
      episodes: {Spotify.PagingSimplifiedEpisodeObject, :t},
      playlists: {Spotify.PagingPlaylistObject, :t},
      shows: {Spotify.PagingSimplifiedShowObject, :t},
      tracks: {Spotify.PagingTrackObject, :t}
    ]
  end
end
