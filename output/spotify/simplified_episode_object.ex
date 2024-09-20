defmodule SimplifiedEpisodeObject do
  @moduledoc """
  Provides struct and type for a SimplifiedEpisodeObject
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
          images: [ImageObject.t()] | nil,
          is_externally_hosted: boolean | nil,
          is_playable: boolean | nil,
          language: String.t() | nil,
          languages: [String.t()] | nil,
          name: String.t() | nil,
          release_date: String.t() | nil,
          release_date_precision: String.t() | nil,
          restrictions: map | nil,
          resume_point: map | nil,
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
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio_preview_url: {:string, :generic},
      description: {:string, :generic},
      duration_ms: :integer,
      explicit: :boolean,
      external_urls: :map,
      href: {:string, :generic},
      html_description: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      is_externally_hosted: :boolean,
      is_playable: :boolean,
      language: {:string, :generic},
      languages: [string: :generic],
      name: {:string, :generic},
      release_date: {:string, :generic},
      release_date_precision: {:enum, ["year", "month", "day"]},
      restrictions: :map,
      resume_point: :map,
      type: {:const, "episode"},
      uri: {:string, :generic}
    ]
  end
end
