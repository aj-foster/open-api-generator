defmodule RealtimeSessionCreateResponse do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateResponse
  """

  @type t :: %__MODULE__{
          client_secret: RealtimeSessionCreateResponseClientSecret.t(),
          input_audio_format: String.t() | nil,
          input_audio_transcription:
            RealtimeSessionCreateResponseInputAudioTranscription.t() | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: integer | String.t() | nil,
          modalities: map | nil,
          output_audio_format: String.t() | nil,
          temperature: number | nil,
          tool_choice: String.t() | nil,
          tools: [RealtimeSessionCreateResponseTools.t()] | nil,
          turn_detection: RealtimeSessionCreateResponseTurnDetection.t() | nil,
          voice: String.t() | nil
        }

  defstruct [
    :client_secret,
    :input_audio_format,
    :input_audio_transcription,
    :instructions,
    :max_response_output_tokens,
    :modalities,
    :output_audio_format,
    :temperature,
    :tool_choice,
    :tools,
    :turn_detection,
    :voice
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      client_secret: {RealtimeSessionCreateResponseClientSecret, :t},
      input_audio_format: {:string, :generic},
      input_audio_transcription: {RealtimeSessionCreateResponseInputAudioTranscription, :t},
      instructions: {:string, :generic},
      max_response_output_tokens: {:union, [:integer, const: "inf"]},
      modalities: :map,
      output_audio_format: {:string, :generic},
      temperature: :number,
      tool_choice: {:string, :generic},
      tools: [{RealtimeSessionCreateResponseTools, :t}],
      turn_detection: {RealtimeSessionCreateResponseTurnDetection, :t},
      voice: {:enum, ["alloy", "ash", "ballad", "coral", "echo", "sage", "shimmer", "verse"]}
    ]
  end
end
