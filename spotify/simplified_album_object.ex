defmodule Spotify.SimplifiedAlbumObject do
  @moduledoc """
  Provides struct and type for a SimplifiedAlbumObject
  """

  @type t :: %__MODULE__{
          album_type: String.t() | nil,
          artists: [Spotify.SimplifiedArtistObject.t()] | nil,
          available_markets: [String.t()] | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          name: String.t() | nil,
          release_date: String.t() | nil,
          release_date_precision: String.t() | nil,
          restrictions: map | nil,
          total_tracks: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :album_type,
    :artists,
    :available_markets,
    :external_urls,
    :href,
    :id,
    :images,
    :name,
    :release_date,
    :release_date_precision,
    :restrictions,
    :total_tracks,
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
      external_urls: :map,
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      name: :string,
      release_date: :string,
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      total_tracks: :integer,
      type: {:const, "album"},
      uri: :string
    ]
  end
end
