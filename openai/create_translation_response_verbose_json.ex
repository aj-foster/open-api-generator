defmodule CreateTranslationResponseVerboseJson do
  @moduledoc """
  Provides struct and type for a CreateTranslationResponseVerboseJson
  """

  @type t :: %__MODULE__{
          duration: number,
          language: String.t(),
          segments: [TranscriptionSegment.t()] | nil,
          text: String.t()
        }

  defstruct [:duration, :language, :segments, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      duration: :number,
      language: {:string, :generic},
      segments: [{TranscriptionSegment, :t}],
      text: {:string, :generic}
    ]
  end
end
