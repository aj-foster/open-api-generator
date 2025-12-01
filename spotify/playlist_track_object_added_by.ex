defmodule Spotify.PlaylistTrackObjectAddedBy do
  @moduledoc """
  Provides struct and type for a PlaylistTrackObjectAddedBy
  """

  @type t :: %__MODULE__{
          external_urls: Spotify.PlaylistTrackObjectAddedByExternalUrls.t() | nil,
          followers: Spotify.PlaylistTrackObjectAddedByFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:external_urls, :followers, :href, :id, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: {Spotify.PlaylistTrackObjectAddedByExternalUrls, :t},
      followers: {Spotify.PlaylistTrackObjectAddedByFollowers, :t},
      href: :string,
      id: :string,
      type: {:const, "user"},
      uri: :string
    ]
  end
end
