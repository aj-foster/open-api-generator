defmodule Spotify.EpisodeObject do
  @moduledoc """
  Provides struct and type for a EpisodeObject
  """

  @type t :: %__MODULE__{
          audio_preview_url: String.t() | nil,
          description: String.t() | nil,
          duration_ms: integer | nil,
          explicit: boolean | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          html_description: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          is_externally_hosted: boolean | nil,
          is_playable: boolean | nil,
          language: String.t() | nil,
          languages: [String.t()] | nil,
          name: String.t() | nil,
          release_date: String.t() | nil,
          release_date_precision: String.t() | nil,
          restrictions: map | nil,
          resume_point: map | nil,
          show: Spotify.EpisodeObjectShow.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :audio_preview_url,
    :description,
    :duration_ms,
    :explicit,
    :external_urls,
    :href,
    :html_description,
    :id,
    :images,
    :is_externally_hosted,
    :is_playable,
    :language,
    :languages,
    :name,
    :release_date,
    :release_date_precision,
    :restrictions,
    :resume_point,
    :show,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio_preview_url: :string,
      description: :string,
      duration_ms: :integer,
      explicit: :boolean,
      external_urls: :map,
      href: :string,
      html_description: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      is_externally_hosted: :boolean,
      is_playable: :boolean,
      language: :string,
      languages: [:string],
      name: :string,
      release_date: :string,
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      resume_point: :map,
      show: {Spotify.EpisodeObjectShow, :t},
      type: {:const, "episode"},
      uri: :string
    ]
  end
end
