defmodule Spotify.SavedEpisodeObject do
  @moduledoc """
  Provides struct and type for a SavedEpisodeObject
  """

  @type t :: %__MODULE__{
          added_at: DateTime.t() | nil,
          episode: Spotify.SavedEpisodeObjectEpisode.t() | nil
        }

  defstruct [:added_at, :episode]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [added_at: {:string, "date-time"}, episode: {Spotify.SavedEpisodeObjectEpisode, :t}]
  end
end
