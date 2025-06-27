defmodule ManyTracks do
  @moduledoc """
  Provides struct and type for a ManyTracks
  """

  @type json_resp :: %__MODULE__{tracks: [TrackObject.t()]}

  defstruct [:tracks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [tracks: [{TrackObject, :t}]]
  end
end
