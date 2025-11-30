defmodule OpenAI.CreateChatCompletionRequestAudio do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionRequestAudio
  """

  @type t :: %__MODULE__{format: String.t(), voice: String.t()}

  defstruct [:format, :voice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      format: {:enum, ["wav", "mp3", "flac", "opus", "pcm16"]},
      voice: {:enum, ["alloy", "ash", "ballad", "coral", "echo", "sage", "shimmer", "verse"]}
    ]
  end
end
