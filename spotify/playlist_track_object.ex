defmodule PlaylistTrackObject do
  @moduledoc """
  Provides struct and type for a PlaylistTrackObject
  """

  @type t :: %__MODULE__{
          added_at: DateTime.t() | nil,
          added_by: PlaylistTrackObjectAddedBy.t() | nil,
          is_local: boolean | nil,
          track: EpisodeObject.t() | TrackObject.t() | nil
        }

  defstruct [:added_at, :added_by, :is_local, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      added_at: {:string, :date_time},
      added_by: {PlaylistTrackObjectAddedBy, :t},
      is_local: :boolean,
      track: {:union, [{EpisodeObject, :t}, {TrackObject, :t}]}
    ]
  end
end
