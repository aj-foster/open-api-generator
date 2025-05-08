defmodule PlaylistObject do
  @moduledoc """
  Provides struct and type for a PlaylistObject
  """

  @type t :: %__MODULE__{
          collaborative: boolean | nil,
          description: String.t() | nil,
          external_urls: PlaylistObjectExternalUrls.t() | nil,
          followers: PlaylistObjectFollowers.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          name: String.t() | nil,
          owner: PlaylistObjectOwner.t() | nil,
          public: boolean | nil,
          snapshot_id: String.t() | nil,
          tracks: PlaylistObjectTracks.t() | nil,
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
      description: {:string, :generic},
      external_urls: {PlaylistObjectExternalUrls, :t},
      followers: {PlaylistObjectFollowers, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      name: {:string, :generic},
      owner: {PlaylistObjectOwner, :t},
      public: :boolean,
      snapshot_id: {:string, :generic},
      tracks: {PlaylistObjectTracks, :t},
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
