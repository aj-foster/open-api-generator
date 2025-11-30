defmodule Spotify.ArtistObject do
  @moduledoc """
  Provides struct and type for a ArtistObject
  """

  @type t :: %__MODULE__{
          external_urls: Spotify.ArtistObjectExternalUrls.t() | nil,
          followers: Spotify.ArtistObjectFollowers.t() | nil,
          genres: [String.t()] | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          name: String.t() | nil,
          popularity: integer | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :external_urls,
    :followers,
    :genres,
    :href,
    :id,
    :images,
    :name,
    :popularity,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: {Spotify.ArtistObjectExternalUrls, :t},
      followers: {Spotify.ArtistObjectFollowers, :t},
      genres: [:string],
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      name: :string,
      popularity: :integer,
      type: {:const, "artist"},
      uri: :string
    ]
  end
end
