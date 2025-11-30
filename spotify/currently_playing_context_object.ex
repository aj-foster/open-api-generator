defmodule Spotify.CurrentlyPlayingContextObject do
  @moduledoc """
  Provides struct and type for a CurrentlyPlayingContextObject
  """

  @type t :: %__MODULE__{
          actions: Spotify.CurrentlyPlayingContextObjectActions.t() | nil,
          context: Spotify.CurrentlyPlayingContextObjectContext.t() | nil,
          currently_playing_type: String.t() | nil,
          device: Spotify.CurrentlyPlayingContextObjectDevice.t() | nil,
          is_playing: boolean | nil,
          item: Spotify.EpisodeObject.t() | Spotify.TrackObject.t() | nil,
          progress_ms: integer | nil,
          repeat_state: String.t() | nil,
          shuffle_state: boolean | nil,
          timestamp: integer | nil
        }

  defstruct [
    :actions,
    :context,
    :currently_playing_type,
    :device,
    :is_playing,
    :item,
    :progress_ms,
    :repeat_state,
    :shuffle_state,
    :timestamp
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: {Spotify.CurrentlyPlayingContextObjectActions, :t},
      context: {Spotify.CurrentlyPlayingContextObjectContext, :t},
      currently_playing_type: :string,
      device: {Spotify.CurrentlyPlayingContextObjectDevice, :t},
      is_playing: :boolean,
      item: {:union, [{Spotify.EpisodeObject, :t}, {Spotify.TrackObject, :t}]},
      progress_ms: :integer,
      repeat_state: :string,
      shuffle_state: :boolean,
      timestamp: :integer
    ]
  end
end
