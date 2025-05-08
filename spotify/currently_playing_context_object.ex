defmodule CurrentlyPlayingContextObject do
  @moduledoc """
  Provides struct and type for a CurrentlyPlayingContextObject
  """

  @type t :: %__MODULE__{
          actions: CurrentlyPlayingContextObjectActions.t() | nil,
          context: CurrentlyPlayingContextObjectContext.t() | nil,
          currently_playing_type: String.t() | nil,
          device: CurrentlyPlayingContextObjectDevice.t() | nil,
          is_playing: boolean | nil,
          item: EpisodeObject.t() | TrackObject.t() | nil,
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
      actions: {CurrentlyPlayingContextObjectActions, :t},
      context: {CurrentlyPlayingContextObjectContext, :t},
      currently_playing_type: {:string, :generic},
      device: {CurrentlyPlayingContextObjectDevice, :t},
      is_playing: :boolean,
      item: {:union, [{EpisodeObject, :t}, {TrackObject, :t}]},
      progress_ms: :integer,
      repeat_state: {:string, :generic},
      shuffle_state: :boolean,
      timestamp: :integer
    ]
  end
end
