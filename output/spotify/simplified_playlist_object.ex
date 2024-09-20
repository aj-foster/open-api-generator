defmodule SimplifiedPlaylistObject do
  @moduledoc """
  Provides struct and type for a SimplifiedPlaylistObject
  """

  @type t :: %__MODULE__{
          collaborative: boolean | nil,
          description: String.t() | nil,
          external_urls: SimplifiedPlaylistObjectExternalUrls.t() | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          images: [ImageObject.t()] | nil,
          name: String.t() | nil,
          owner: SimplifiedPlaylistObjectOwner.t() | nil,
          public: boolean | nil,
          snapshot_id: String.t() | nil,
          tracks: SimplifiedPlaylistObjectTracks.t() | nil,
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
      description: {:string, :generic},
      external_urls: {SimplifiedPlaylistObjectExternalUrls, :t},
      href: {:string, :generic},
      id: {:string, :generic},
      images: [{ImageObject, :t}],
      name: {:string, :generic},
      owner: {SimplifiedPlaylistObjectOwner, :t},
      public: :boolean,
      snapshot_id: {:string, :generic},
      tracks: {SimplifiedPlaylistObjectTracks, :t},
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
