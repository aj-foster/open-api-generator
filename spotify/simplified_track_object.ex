defmodule SimplifiedTrackObject do
  @moduledoc """
  Provides struct and type for a SimplifiedTrackObject
  """

  @type t :: %__MODULE__{
          artists: [SimplifiedArtistObject.t()] | nil,
          available_markets: [String.t()] | nil,
          disc_number: integer | nil,
          duration_ms: integer | nil,
          explicit: boolean | nil,
          external_urls: SimplifiedTrackObjectExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          is_local: boolean | nil,
          is_playable: boolean | nil,
          linked_from: SimplifiedTrackObjectLinkedFrom.t() | nil,
          name: String.t() | nil,
          preview_url: String.t() | nil,
          restrictions: SimplifiedTrackObjectRestrictions.t() | nil,
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
      artists: [{SimplifiedArtistObject, :t}],
      available_markets: [string: :generic],
      disc_number: :integer,
      duration_ms: :integer,
      explicit: :boolean,
      external_urls: {SimplifiedTrackObjectExternalUrls, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      is_local: :boolean,
      is_playable: :boolean,
      linked_from: {SimplifiedTrackObjectLinkedFrom, :t},
      name: {:string, :generic},
      preview_url: {:string, :generic},
      restrictions: {SimplifiedTrackObjectRestrictions, :t},
      track_number: :integer,
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
