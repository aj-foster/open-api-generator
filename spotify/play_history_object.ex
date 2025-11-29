defmodule PlayHistoryObject do
  @moduledoc """
  Provides struct and type for a PlayHistoryObject
  """

  @type t :: %__MODULE__{
          context: PlayHistoryObjectContext.t() | nil,
          played_at: DateTime.t() | nil,
          track: PlayHistoryObjectTrack.t() | nil
        }

  defstruct [:context, :played_at, :track]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      context: {PlayHistoryObjectContext, :t},
      played_at: {:string, :date_time},
      track: {PlayHistoryObjectTrack, :t}
    ]
  end
end
