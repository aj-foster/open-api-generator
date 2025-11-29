defmodule SavedTrackObjectTrack do
  @moduledoc """
  Provides struct and type for a SavedTrackObjectTrack
  """

  @type t :: %__MODULE__{
          album: map | nil,
          artists: [ArtistObject.t()] | nil,
          available_markets: [String.t()] | nil,
          disc_number: integer | nil,
          duration_ms: integer | nil,
          explicit: boolean | nil,
          external_ids: map | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          is_local: boolean | nil,
          is_playable: boolean | nil,
          linked_from: map | nil,
          name: String.t() | nil,
          popularity: integer | nil,
          preview_url: String.t() | nil,
          restrictions: map | nil,
          track_number: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :album,
    :artists,
    :available_markets,
    :disc_number,
    :duration_ms,
    :explicit,
    :external_ids,
    :external_urls,
    :href,
    :id,
    :is_local,
    :is_playable,
    :linked_from,
    :name,
    :popularity,
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
      album: :map,
      artists: [{ArtistObject, :t}],
      available_markets: [string: :generic],
      disc_number: :integer,
      duration_ms: :integer,
      explicit: :boolean,
      external_ids: :map,
      external_urls: :map,
      href: {:string, :generic},
      id: {:string, :generic},
      is_local: :boolean,
      is_playable: :boolean,
      linked_from: :map,
      name: {:string, :generic},
      popularity: :integer,
      preview_url: {:string, :generic},
      restrictions: :map,
      track_number: :integer,
      type: {:const, "track"},
      uri: {:string, :generic}
    ]
  end
end
