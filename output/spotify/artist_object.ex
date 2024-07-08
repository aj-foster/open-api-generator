defmodule ArtistObject do
  @moduledoc """
  Provides struct and type for a ArtistObject
  """

  @type t :: %__MODULE__{
          external_urls: ArtistObjectExternalUrls.t() | nil,
          followers: ArtistObjectFollowers.t() | nil,
          genres: [String.t()] | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
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
      external_urls: {ArtistObjectExternalUrls, :t},
      followers: {ArtistObjectFollowers, :t},
      genres: [string: :generic],
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      name: {:string, :generic},
      popularity: :integer,
      type: {:const, "artist"},
      uri: {:string, :generic}
    ]
  end
end
