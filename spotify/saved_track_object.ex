defmodule SavedTrackObject do
  @moduledoc """
  Provides struct and type for a SavedTrackObject
  """

  @type t :: %__MODULE__{added_at: DateTime.t() | nil, track: SavedTrackObjectTrack.t() | nil}

  defstruct [:added_at, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [added_at: {:string, :date_time}, track: {SavedTrackObjectTrack, :t}]
  end
end
