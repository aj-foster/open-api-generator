defmodule Spotify.ManyChapters do
  @moduledoc """
  Provides struct and type for a ManyChapters
  """

  @type json_resp :: %__MODULE__{chapters: [Spotify.ChapterObject.t()]}

  defstruct [:chapters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [chapters: [{Spotify.ChapterObject, :t}]]
  end
end
