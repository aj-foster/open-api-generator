defmodule Spotify.ManyAudioFeatures do
  @moduledoc """
  Provides struct and type for a ManyAudioFeatures
  """

  @type json_resp :: %__MODULE__{audio_features: [Spotify.AudioFeaturesObject.t()]}

  defstruct [:audio_features]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [audio_features: [{Spotify.AudioFeaturesObject, :t}]]
  end
end
