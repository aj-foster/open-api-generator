defmodule Spotify.AudiobookObject do
  @moduledoc """
  Provides struct and type for a AudiobookObject
  """

  @type t :: %__MODULE__{
          authors: [Spotify.AuthorObject.t()] | nil,
          available_markets: [String.t()] | nil,
          chapters: Spotify.AudiobookObjectChapters.t() | nil,
          copyrights: [Spotify.CopyrightObject.t()] | nil,
          description: String.t() | nil,
          edition: String.t() | nil,
          explicit: boolean | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          html_description: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          languages: [String.t()] | nil,
          media_type: String.t() | nil,
          name: String.t() | nil,
          narrators: [Spotify.NarratorObject.t()] | nil,
          publisher: String.t() | nil,
          total_chapters: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :authors,
    :available_markets,
    :chapters,
    :copyrights,
    :description,
    :edition,
    :explicit,
    :external_urls,
    :href,
    :html_description,
    :id,
    :images,
    :languages,
    :media_type,
    :name,
    :narrators,
    :publisher,
    :total_chapters,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authors: [{Spotify.AuthorObject, :t}],
      available_markets: [:string],
      chapters: {Spotify.AudiobookObjectChapters, :t},
      copyrights: [{Spotify.CopyrightObject, :t}],
      description: :string,
      edition: :string,
      explicit: :boolean,
      external_urls: :map,
      href: :string,
      html_description: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      languages: [:string],
      media_type: :string,
      name: :string,
      narrators: [{Spotify.NarratorObject, :t}],
      publisher: :string,
      total_chapters: :integer,
      type: {:const, "audiobook"},
      uri: :string
    ]
  end
end
