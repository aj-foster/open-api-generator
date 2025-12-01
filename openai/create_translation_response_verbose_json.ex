defmodule OpenAI.CreateTranslationResponseVerboseJson do
  @moduledoc """
  Provides struct and type for a CreateTranslationResponseVerboseJson
  """

  @type t :: %__MODULE__{
          duration: number,
          language: String.t(),
          segments: [OpenAI.TranscriptionSegment.t()] | nil,
          text: String.t()
        }

  defstruct [:duration, :language, :segments, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      duration: :number,
      language: :string,
      segments: [{OpenAI.TranscriptionSegment, :t}],
      text: :string
    ]
  end
end
