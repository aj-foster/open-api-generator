defmodule ManyEpisodes do
  @moduledoc """
  Provides struct and type for a ManyEpisodes
  """

  @type json_resp :: %__MODULE__{episodes: [EpisodeObject.t()]}

  defstruct [:episodes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [episodes: [{EpisodeObject, :t}]]
  end
end
