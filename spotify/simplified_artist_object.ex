defmodule Spotify.SimplifiedArtistObject do
  @moduledoc """
  Provides struct and type for a SimplifiedArtistObject
  """

  @type t :: %__MODULE__{
          external_urls: Spotify.SimplifiedArtistObjectExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:external_urls, :href, :id, :name, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: {Spotify.SimplifiedArtistObjectExternalUrls, :t},
      href: :string,
      id: :string,
      name: :string,
      type: {:const, "artist"},
      uri: :string
    ]
  end
end
