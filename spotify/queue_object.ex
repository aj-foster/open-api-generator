defmodule QueueObject do
  @moduledoc """
  Provides struct and type for a QueueObject
  """

  @type t :: %__MODULE__{
          currently_playing: EpisodeObject.t() | TrackObject.t() | nil,
          queue: [EpisodeObject.t() | TrackObject.t()] | nil
        }

  defstruct [:currently_playing, :queue]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      currently_playing: {:union, [{EpisodeObject, :t}, {TrackObject, :t}]},
      queue: [union: [{EpisodeObject, :t}, {TrackObject, :t}]]
    ]
  end
end
