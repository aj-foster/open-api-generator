defmodule AudiobookObject do
  @moduledoc """
  Provides struct and type for a AudiobookObject
  """

  @type t :: %__MODULE__{
          authors: [AuthorObject.t()] | nil,
          available_markets: [String.t()] | nil,
          chapters: AudiobookObjectChapters.t() | nil,
          copyrights: [CopyrightObject.t()] | nil,
          description: String.t() | nil,
          edition: String.t() | nil,
          explicit: boolean | nil,
          external_urls: map | nil,
          href: String.t() | nil,
          html_description: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          languages: [String.t()] | nil,
          media_type: String.t() | nil,
          name: String.t() | nil,
          narrators: [NarratorObject.t()] | nil,
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
      authors: [{AuthorObject, :t}],
      available_markets: [string: :generic],
      chapters: {AudiobookObjectChapters, :t},
      copyrights: [{CopyrightObject, :t}],
      description: {:string, :generic},
      edition: {:string, :generic},
      explicit: :boolean,
      external_urls: :map,
      href: {:string, :generic},
      html_description: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      languages: [string: :generic],
      media_type: {:string, :generic},
      name: {:string, :generic},
      narrators: [{NarratorObject, :t}],
      publisher: {:string, :generic},
      total_chapters: :integer,
      type: {:const, "audiobook"},
      uri: {:string, :generic}
    ]
  end
end
