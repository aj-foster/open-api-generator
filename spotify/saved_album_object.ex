defmodule SavedAlbumObject do
  @moduledoc """
  Provides struct and type for a SavedAlbumObject
  """

  @type t :: %__MODULE__{added_at: DateTime.t() | nil, album: SavedAlbumObjectAlbum.t() | nil}

  defstruct [:added_at, :album]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [added_at: {:string, :date_time}, album: {SavedAlbumObjectAlbum, :t}]
  end
end
