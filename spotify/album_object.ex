defmodule Spotify.AlbumObject do
  @moduledoc """
  Provides struct and type for a AlbumObject
  """

  @type t :: %__MODULE__{
          album_type: String.t() | nil,
          artists: [Spotify.SimplifiedArtistObject.t()],
          available_markets: [String.t()] | nil,
          copyrights: [Spotify.CopyrightObject.t()],
          external_ids: Spotify.AlbumObjectExternalIds.t(),
          external_urls: map | nil,
          genres: [String.t()],
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          label: String.t(),
          name: String.t() | nil,
          popularity: integer,
          release_date: String.t() | nil,
          release_date_precision: String.t() | nil,
          restrictions: map | nil,
          total_tracks: integer | nil,
          tracks: Spotify.AlbumObjectTracks.t(),
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :album_type,
    :artists,
    :available_markets,
    :copyrights,
    :external_ids,
    :external_urls,
    :genres,
    :href,
    :id,
    :images,
    :label,
    :name,
    :popularity,
    :release_date,
    :release_date_precision,
    :restrictions,
    :total_tracks,
    :tracks,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      album_type: {:enum, ["album", "single", "compilation"]},
      artists: [{Spotify.SimplifiedArtistObject, :t}],
      available_markets: [:string],
      copyrights: [{Spotify.CopyrightObject, :t}],
      external_ids: {Spotify.AlbumObjectExternalIds, :t},
      external_urls: :map,
      genres: [:string],
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      label: :string,
      name: :string,
      popularity: :integer,
      release_date: :string,
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      total_tracks: :integer,
      tracks: {Spotify.AlbumObjectTracks, :t},
      type: {:const, "album"},
      uri: :string
    ]
  end
end
