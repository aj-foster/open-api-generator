defmodule Spotify.PublicUserObject do
  @moduledoc """
  Provides struct and type for a PublicUserObject
  """

  @type t :: %__MODULE__{
          display_name: String.t() | nil,
          external_urls: Spotify.PublicUserObjectExternalUrls.t() | nil,
          followers: Spotify.PublicUserObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:display_name, :external_urls, :followers, :href, :id, :images, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      display_name: :string,
      external_urls: {Spotify.PublicUserObjectExternalUrls, :t},
      followers: {Spotify.PublicUserObjectFollowers, :t},
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      type: {:const, "user"},
      uri: :string
    ]
  end
end
