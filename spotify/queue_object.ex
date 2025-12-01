defmodule Spotify.QueueObject do
  @moduledoc """
  Provides struct and type for a QueueObject
  """

  @type t :: %__MODULE__{
          currently_playing: Spotify.EpisodeObject.t() | Spotify.TrackObject.t() | nil,
          queue: [Spotify.EpisodeObject.t() | Spotify.TrackObject.t()] | nil
        }

  defstruct [:currently_playing, :queue]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      currently_playing: {:union, [{Spotify.EpisodeObject, :t}, {Spotify.TrackObject, :t}]},
      queue: [union: [{Spotify.EpisodeObject, :t}, {Spotify.TrackObject, :t}]]
    ]
  end
end
