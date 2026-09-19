defmodule Spotify.PlaylistObject do
  @moduledoc """
  Provides struct and type for a PlaylistObject
  """

  @type t :: %__MODULE__{
          collaborative: boolean | nil,
          description: String.t() | nil,
          external_urls: Spotify.PlaylistObjectExternalUrls.t() | nil,
          followers: Spotify.PlaylistObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          name: String.t() | nil,
          owner: Spotify.PlaylistObjectOwner.t() | nil,
          public: boolean | nil,
          snapshot_id: String.t() | nil,
          tracks: Spotify.PlaylistObjectTracks.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :collaborative,
    :description,
    :external_urls,
    :followers,
    :href,
    :id,
    :images,
    :name,
    :owner,
    :public,
    :snapshot_id,
    :tracks,
    :type,
    :uri
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collaborative: :boolean,
      description: :string,
      external_urls: {Spotify.PlaylistObjectExternalUrls, :t},
      followers: {Spotify.PlaylistObjectFollowers, :t},
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      name: :string,
      owner: {Spotify.PlaylistObjectOwner, :t},
      public: :boolean,
      snapshot_id: :string,
      tracks: {Spotify.PlaylistObjectTracks, :t},
      type: :string,
      uri: :string
    ]
  end
end
