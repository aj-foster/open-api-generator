defmodule Spotify.SimplifiedTrackObject do
  @moduledoc """
  Provides struct and type for a SimplifiedTrackObject
  """

  @type t :: %__MODULE__{
          artists: [Spotify.SimplifiedArtistObject.t()] | nil,
          available_markets: [String.t()] | nil,
          disc_number: integer | nil,
          duration_ms: integer | nil,
          explicit: boolean | nil,
          external_urls: Spotify.SimplifiedTrackObjectExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          is_local: boolean | nil,
          is_playable: boolean | nil,
          linked_from: Spotify.SimplifiedTrackObjectLinkedFrom.t() | nil,
          name: String.t() | nil,
          preview_url: String.t() | nil,
          restrictions: Spotify.SimplifiedTrackObjectRestrictions.t() | nil,
          track_number: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :artists,
    :available_markets,
    :disc_number,
    :duration_ms,
    :explicit,
    :external_urls,
    :href,
    :id,
    :is_local,
    :is_playable,
    :linked_from,
    :name,
    :preview_url,
    :restrictions,
    :track_number,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      artists: [{Spotify.SimplifiedArtistObject, :t}],
      available_markets: [:string],
      disc_number: :integer,
      duration_ms: :integer,
      explicit: :boolean,
      external_urls: {Spotify.SimplifiedTrackObjectExternalUrls, :t},
      href: :string,
      id: :string,
      is_local: :boolean,
      is_playable: :boolean,
      linked_from: {Spotify.SimplifiedTrackObjectLinkedFrom, :t},
      name: :string,
      preview_url: :string,
      restrictions: {Spotify.SimplifiedTrackObjectRestrictions, :t},
      track_number: :integer,
      type: :string,
      uri: :string
    ]
  end
end
