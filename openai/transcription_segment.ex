defmodule TranscriptionSegment do
  @moduledoc """
  Provides struct and type for a TranscriptionSegment
  """

  @type t :: %__MODULE__{
          avg_logprob: number,
          compression_ratio: number,
          end: number,
          id: integer,
          no_speech_prob: number,
          seek: integer,
          start: number,
          temperature: number,
          text: String.t(),
          tokens: [integer]
        }

  defstruct [
    :avg_logprob,
    :compression_ratio,
    :end,
    :id,
    :no_speech_prob,
    :seek,
    :start,
    :temperature,
    :text,
    :tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avg_logprob: :number,
      compression_ratio: :number,
      end: :number,
      id: :integer,
      no_speech_prob: :number,
      seek: :integer,
      start: :number,
      temperature: :number,
      text: {:string, :generic},
      tokens: [:integer]
    ]
  end
end
