defmodule Spotify.ManyEpisodes do
  @moduledoc """
  Provides struct and type for a ManyEpisodes
  """

  @type json_resp :: %__MODULE__{episodes: [Spotify.EpisodeObject.t()]}

  defstruct [:episodes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [episodes: [{Spotify.EpisodeObject, :t}]]
  end
end
