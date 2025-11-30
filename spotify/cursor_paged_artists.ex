defmodule Spotify.CursorPagedArtists do
  @moduledoc """
  Provides struct and type for a CursorPagedArtists
  """

  @type json_resp :: %__MODULE__{artists: Spotify.CursorPagingSimplifiedArtistObject.t()}

  defstruct [:artists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [artists: {Spotify.CursorPagingSimplifiedArtistObject, :t}]
  end
end
