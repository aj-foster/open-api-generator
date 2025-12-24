defmodule Spotify.PrivateUserObject do
  @moduledoc """
  Provides struct and type for a PrivateUserObject
  """

  @type t :: %__MODULE__{
          country: String.t() | nil,
          display_name: String.t() | nil,
          email: String.t() | nil,
          explicit_content: Spotify.PrivateUserObjectExplicitContent.t() | nil,
          external_urls: Spotify.PrivateUserObjectExternalUrls.t() | nil,
          followers: Spotify.PrivateUserObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          product: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :country,
    :display_name,
    :email,
    :explicit_content,
    :external_urls,
    :followers,
    :href,
    :id,
    :images,
    :product,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      country: :string,
      display_name: :string,
      email: :string,
      explicit_content: {Spotify.PrivateUserObjectExplicitContent, :t},
      external_urls: {Spotify.PrivateUserObjectExternalUrls, :t},
      followers: {Spotify.PrivateUserObjectFollowers, :t},
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      product: :string,
      type: :string,
      uri: :string
    ]
  end
end
