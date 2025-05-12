defmodule SearchItems do
  @moduledoc """
  Provides struct and type for a SearchItems
  """

  @type json_resp :: %__MODULE__{
          albums: PagingSimplifiedAlbumObject.t() | nil,
          artists: PagingArtistObject.t() | nil,
          audiobooks: PagingSimplifiedAudiobookObject.t() | nil,
          episodes: PagingSimplifiedEpisodeObject.t() | nil,
          playlists: PagingPlaylistObject.t() | nil,
          shows: PagingSimplifiedShowObject.t() | nil,
          tracks: PagingTrackObject.t() | nil
        }

  defstruct [:albums, :artists, :audiobooks, :episodes, :playlists, :shows, :tracks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [
      albums: {PagingSimplifiedAlbumObject, :t},
      artists: {PagingArtistObject, :t},
      audiobooks: {PagingSimplifiedAudiobookObject, :t},
      episodes: {PagingSimplifiedEpisodeObject, :t},
      playlists: {PagingPlaylistObject, :t},
      shows: {PagingSimplifiedShowObject, :t},
      tracks: {PagingTrackObject, :t}
    ]
  end
end
