defmodule OpenAI.ResponseAudioTranscriptDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseAudioTranscriptDeltaEvent
  """

  @type t :: %__MODULE__{delta: String.t(), type: String.t()}

  defstruct [:delta, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [delta: :string, type: {:const, "response.audio.transcript.delta"}]
  end
end
