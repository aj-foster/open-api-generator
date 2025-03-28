defmodule CurrentlyPlayingContextObjectActions do
  @moduledoc """
  Provides struct and type for a CurrentlyPlayingContextObjectActions
  """

  @type t :: %__MODULE__{
          interrupting_playback: boolean | nil,
          pausing: boolean | nil,
          resuming: boolean | nil,
          seeking: boolean | nil,
          skipping_next: boolean | nil,
          skipping_prev: boolean | nil,
          toggling_repeat_context: boolean | nil,
          toggling_repeat_track: boolean | nil,
          toggling_shuffle: boolean | nil,
          transferring_playback: boolean | nil
        }

  defstruct [
    :interrupting_playback,
    :pausing,
    :resuming,
    :seeking,
    :skipping_next,
    :skipping_prev,
    :toggling_repeat_context,
    :toggling_repeat_track,
    :toggling_shuffle,
    :transferring_playback
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      interrupting_playback: :boolean,
      pausing: :boolean,
      resuming: :boolean,
      seeking: :boolean,
      skipping_next: :boolean,
      skipping_prev: :boolean,
      toggling_repeat_context: :boolean,
      toggling_repeat_track: :boolean,
      toggling_shuffle: :boolean,
      transferring_playback: :boolean
    ]
  end
end
