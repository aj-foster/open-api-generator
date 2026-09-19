defmodule Spotify.ManyAlbums do
  @moduledoc """
  Provides struct and type for a ManyAlbums
  """

  @type json_resp :: %__MODULE__{albums: [Spotify.AlbumObject.t()]}

  defstruct [:albums]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [albums: [{Spotify.AlbumObject, :t}]]
  end
end
