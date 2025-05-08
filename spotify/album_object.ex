defmodule AlbumObject do
  @moduledoc """
  Provides struct and type for a AlbumObject
  """

  @type t :: %__MODULE__{
          album_type: String.t() | nil,
          artists: [SimplifiedArtistObject.t()],
          available_markets: [String.t()] | nil,
          copyrights: [CopyrightObject.t()],
          external_ids: AlbumObjectExternalIds.t(),
          external_urls: map | nil,
          genres: [String.t()],
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          label: String.t(),
          name: String.t() | nil,
          popularity: integer,
          release_date: String.t() | nil,
          release_date_precision: String.t() | nil,
          restrictions: map | nil,
          total_tracks: integer | nil,
          tracks: AlbumObjectTracks.t(),
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
      artists: [{SimplifiedArtistObject, :t}],
      available_markets: [string: :generic],
      copyrights: [{CopyrightObject, :t}],
      external_ids: {AlbumObjectExternalIds, :t},
      external_urls: :map,
      genres: [string: :generic],
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      label: {:string, :generic},
      name: {:string, :generic},
      popularity: :integer,
      release_date: {:string, :generic},
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      total_tracks: :integer,
      tracks: {AlbumObjectTracks, :t},
      type: {:const, "album"},
      uri: {:string, :generic}
    ]
  end
end
