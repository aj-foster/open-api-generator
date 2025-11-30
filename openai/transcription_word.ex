defmodule OpenAI.TranscriptionWord do
  @moduledoc """
  Provides struct and type for a TranscriptionWord
  """

  @type t :: %__MODULE__{end: number, start: number, word: String.t()}

  defstruct [:end, :start, :word]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end: {:number, "float"}, start: {:number, "float"}, word: :string]
  end
end
