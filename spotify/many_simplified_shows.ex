defmodule Spotify.ManySimplifiedShows do
  @moduledoc """
  Provides struct and type for a ManySimplifiedShows
  """

  @type json_resp :: %__MODULE__{shows: [Spotify.SimplifiedShowObject.t()]}

  defstruct [:shows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [shows: [{Spotify.SimplifiedShowObject, :t}]]
  end
end
