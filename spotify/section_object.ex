defmodule SectionObject do
  @moduledoc """
  Provides struct and type for a SectionObject
  """

  @type t :: %__MODULE__{
          confidence: number | nil,
          duration: number | nil,
          key: integer | nil,
          key_confidence: number | nil,
          loudness: number | nil,
          mode: -1 | 0 | 1 | nil,
          mode_confidence: number | nil,
          start: number | nil,
          tempo: number | nil,
          tempo_confidence: number | nil,
          time_signature: integer | nil,
          time_signature_confidence: number | nil
        }

  defstruct [
    :confidence,
    :duration,
    :key,
    :key_confidence,
    :loudness,
    :mode,
    :mode_confidence,
    :start,
    :tempo,
    :tempo_confidence,
    :time_signature,
    :time_signature_confidence
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confidence: :number,
      duration: :number,
      key: :integer,
      key_confidence: :number,
      loudness: :number,
      mode: {:enum, [-1, 0, 1]},
      mode_confidence: :number,
      start: :number,
      tempo: :number,
      tempo_confidence: :number,
      time_signature: :integer,
      time_signature_confidence: :number
    ]
  end
end
