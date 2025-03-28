defmodule ArtistDiscographyAlbumObject do
  @moduledoc """
  Provides struct and type for a ArtistDiscographyAlbumObject
  """

  @type t :: %__MODULE__{album_group: String.t() | nil}

  defstruct [:album_group]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [album_group: {:enum, ["album", "single", "compilation", "appears_on"]}]
  end
end
