defmodule Spotify.AudioFeaturesObject do
  @moduledoc """
  Provides struct and type for a AudioFeaturesObject
  """

  @type t :: %__MODULE__{
          acousticness: number | nil,
          analysis_url: String.t() | nil,
          danceability: number | nil,
          duration_ms: integer | nil,
          energy: number | nil,
          id: String.t() | nil,
          instrumentalness: number | nil,
          key: integer | nil,
          liveness: number | nil,
          loudness: number | nil,
          mode: integer | nil,
          speechiness: number | nil,
          tempo: number | nil,
          time_signature: integer | nil,
          track_href: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil,
          valence: number | nil
        }

  defstruct [
    :acousticness,
    :analysis_url,
    :danceability,
    :duration_ms,
    :energy,
    :id,
    :instrumentalness,
    :key,
    :liveness,
    :loudness,
    :mode,
    :speechiness,
    :tempo,
    :time_signature,
    :track_href,
    :type,
    :uri,
    :valence
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acousticness: {:number, "float"},
      analysis_url: :string,
      danceability: {:number, "float"},
      duration_ms: :integer,
      energy: {:number, "float"},
      id: :string,
      instrumentalness: {:number, "float"},
      key: :integer,
      liveness: {:number, "float"},
      loudness: {:number, "float"},
      mode: :integer,
      speechiness: {:number, "float"},
      tempo: {:number, "float"},
      time_signature: :integer,
      track_href: :string,
      type: {:const, "audio_features"},
      uri: :string,
      valence: {:number, "float"}
    ]
  end
end
