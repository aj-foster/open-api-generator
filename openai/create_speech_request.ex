defmodule OpenAI.CreateSpeechRequest do
  @moduledoc """
  Provides struct and type for a CreateSpeechRequest
  """

  @type t :: %__MODULE__{
          input: String.t(),
          model: String.t(),
          response_format: String.t() | nil,
          speed: number | nil,
          voice: String.t()
        }

  defstruct [:input, :model, :response_format, :speed, :voice]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: :string,
      model: {:union, [:string, enum: ["tts-1", "tts-1-hd"]]},
      response_format: {:enum, ["mp3", "opus", "aac", "flac", "wav", "pcm"]},
      speed: :number,
      voice:
        {:enum, ["alloy", "ash", "coral", "echo", "fable", "onyx", "nova", "sage", "shimmer"]}
    ]
  end
end
