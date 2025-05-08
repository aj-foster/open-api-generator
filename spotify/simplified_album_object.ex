defmodule SimplifiedAlbumObject do
  @moduledoc """
  Provides struct and type for a SimplifiedAlbumObject
  """

  @type t :: %__MODULE__{
          album_type: String.t() | nil,
          artists: [SimplifiedArtistObject.t()] | nil,
          available_markets: [String.t()] | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
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
      artists: [{SimplifiedArtistObject, :t}],
      available_markets: [string: :generic],
      external_urls: :map,
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      name: {:string, :generic},
      release_date: {:string, :generic},
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      total_tracks: :integer,
      type: {:const, "album"},
      uri: {:string, :generic}
    ]
  end
end
