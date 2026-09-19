defmodule Spotify.ManyAudiobooks do
  @moduledoc """
  Provides struct and type for a ManyAudiobooks
  """

  @type json_resp :: %__MODULE__{audiobooks: [Spotify.AudiobookObject.t()]}

  defstruct [:audiobooks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [audiobooks: [{Spotify.AudiobookObject, :t}]]
  end
end
