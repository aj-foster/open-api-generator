defmodule PagingFeaturedPlaylistObject do
  @moduledoc """
  Provides struct and type for a PagingFeaturedPlaylistObject
  """

  @type t :: %__MODULE__{message: String.t() | nil, playlists: PagingPlaylistObject.t() | nil}

  defstruct [:message, :playlists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:string, :generic}, playlists: {PagingPlaylistObject, :t}]
  end
end
