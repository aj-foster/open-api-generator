defmodule AudioAnalysisObjectTrack do
  @moduledoc """
  Provides struct and type for a AudioAnalysisObjectTrack
  """

  @type t :: %__MODULE__{
          analysis_channels: integer | nil,
          analysis_sample_rate: integer | nil,
          code_version: number | nil,
          codestring: String.t() | nil,
          duration: number | nil,
          echoprint_version: number | nil,
          echoprintstring: String.t() | nil,
          end_of_fade_in: number | nil,
          key: integer | nil,
          key_confidence: number | nil,
          loudness: number | nil,
          mode: integer | nil,
          mode_confidence: number | nil,
          num_samples: integer | nil,
          offset_seconds: integer | nil,
          rhythm_version: number | nil,
          rhythmstring: String.t() | nil,
          sample_md5: String.t() | nil,
          start_of_fade_out: number | nil,
          synch_version: number | nil,
          synchstring: String.t() | nil,
          tempo: number | nil,
          tempo_confidence: number | nil,
          time_signature: integer | nil,
          time_signature_confidence: number | nil,
          window_seconds: integer | nil
        }

  defstruct [
    :analysis_channels,
    :analysis_sample_rate,
    :code_version,
    :codestring,
    :duration,
    :echoprint_version,
    :echoprintstring,
    :end_of_fade_in,
    :key,
    :key_confidence,
    :loudness,
    :mode,
    :mode_confidence,
    :num_samples,
    :offset_seconds,
    :rhythm_version,
    :rhythmstring,
    :sample_md5,
    :start_of_fade_out,
    :synch_version,
    :synchstring,
    :tempo,
    :tempo_confidence,
    :time_signature,
    :time_signature_confidence,
    :window_seconds
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      analysis_channels: :integer,
      analysis_sample_rate: :integer,
      code_version: :number,
      codestring: {:string, :generic},
      duration: :number,
      echoprint_version: :number,
      echoprintstring: {:string, :generic},
      end_of_fade_in: :number,
      key: :integer,
      key_confidence: :number,
      loudness: :number,
      mode: :integer,
      mode_confidence: :number,
      num_samples: :integer,
      offset_seconds: :integer,
      rhythm_version: :number,
      rhythmstring: {:string, :generic},
      sample_md5: {:string, :generic},
      start_of_fade_out: :number,
      synch_version: :number,
      synchstring: {:string, :generic},
      tempo: :number,
      tempo_confidence: :number,
      time_signature: :integer,
      time_signature_confidence: :number,
      window_seconds: :integer
    ]
  end
end
