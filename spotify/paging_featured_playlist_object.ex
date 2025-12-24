defmodule Spotify.PagingFeaturedPlaylistObject do
  @moduledoc """
  Provides struct and type for a PagingFeaturedPlaylistObject
  """

  @type t :: %__MODULE__{
          message: String.t() | nil,
          playlists: Spotify.PagingPlaylistObject.t() | nil
        }

  defstruct [:message, :playlists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: :string, playlists: {Spotify.PagingPlaylistObject, :t}]
  end
end
