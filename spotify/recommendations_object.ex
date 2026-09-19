defmodule Spotify.RecommendationsObject do
  @moduledoc """
  Provides struct and type for a RecommendationsObject
  """

  @type t :: %__MODULE__{
          seeds: [Spotify.RecommendationSeedObject.t()],
          tracks: [Spotify.TrackObject.t()]
        }

  defstruct [:seeds, :tracks]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [seeds: [{Spotify.RecommendationSeedObject, :t}], tracks: [{Spotify.TrackObject, :t}]]
  end
end
