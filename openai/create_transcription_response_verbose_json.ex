defmodule OpenAI.CreateTranscriptionResponseVerboseJson do
  @moduledoc """
  Provides struct and type for a CreateTranscriptionResponseVerboseJson
  """

  @type t :: %__MODULE__{
          duration: number,
          language: String.t(),
          segments: [OpenAI.TranscriptionSegment.t()] | nil,
          text: String.t(),
          words: [OpenAI.TranscriptionWord.t()] | nil
        }

  defstruct [:duration, :language, :segments, :text, :words]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      duration: :number,
      language: :string,
      segments: [{OpenAI.TranscriptionSegment, :t}],
      text: :string,
      words: [{OpenAI.TranscriptionWord, :t}]
    ]
  end
end
