defmodule Spotify.SimplifiedPlaylistObject do
  @moduledoc """
  Provides struct and type for a SimplifiedPlaylistObject
  """

  @type t :: %__MODULE__{
          collaborative: boolean | nil,
          description: String.t() | nil,
          external_urls: Spotify.SimplifiedPlaylistObjectExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [Spotify.ImageObject.t()] | nil,
          name: String.t() | nil,
          owner: Spotify.SimplifiedPlaylistObjectOwner.t() | nil,
          public: boolean | nil,
          snapshot_id: String.t() | nil,
          tracks: Spotify.SimplifiedPlaylistObjectTracks.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [
    :collaborative,
    :description,
    :external_urls,
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
      external_urls: {Spotify.SimplifiedPlaylistObjectExternalUrls, :t},
      href: :string,
      id: :string,
      images: [{Spotify.ImageObject, :t}],
      name: :string,
      owner: {Spotify.SimplifiedPlaylistObjectOwner, :t},
      public: :boolean,
      snapshot_id: :string,
      tracks: {Spotify.SimplifiedPlaylistObjectTracks, :t},
      type: :string,
      uri: :string
    ]
  end
end
