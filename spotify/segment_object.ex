defmodule SegmentObject do
  @moduledoc """
  Provides struct and type for a SegmentObject
  """

  @type t :: %__MODULE__{
          confidence: number | nil,
          duration: number | nil,
          loudness_end: number | nil,
          loudness_max: number | nil,
          loudness_max_time: number | nil,
          loudness_start: number | nil,
          pitches: [number] | nil,
          start: number | nil,
          timbre: [number] | nil
        }

  defstruct [
    :confidence,
    :duration,
    :loudness_end,
    :loudness_max,
    :loudness_max_time,
    :loudness_start,
    :pitches,
    :start,
    :timbre
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      confidence: :number,
      duration: :number,
      loudness_end: :number,
      loudness_max: :number,
      loudness_max_time: :number,
      loudness_start: :number,
      pitches: [:number],
      start: :number,
      timbre: [:number]
    ]
  end
end
