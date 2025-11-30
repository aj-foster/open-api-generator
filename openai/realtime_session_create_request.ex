defmodule OpenAI.RealtimeSessionCreateRequest do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateRequest
  """

  @type t :: %__MODULE__{
          input_audio_format: String.t() | nil,
          input_audio_transcription:
            OpenAI.RealtimeSessionCreateRequestInputAudioTranscription.t() | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: integer | String.t() | nil,
          modalities: map | nil,
          model: String.t() | nil,
          output_audio_format: String.t() | nil,
          temperature: number | nil,
          tool_choice: String.t() | nil,
          tools: [OpenAI.RealtimeSessionCreateRequestTools.t()] | nil,
          turn_detection: OpenAI.RealtimeSessionCreateRequestTurnDetection.t() | nil,
          voice: String.t() | nil
        }

  defstruct [
    :input_audio_format,
    :input_audio_transcription,
    :instructions,
    :max_response_output_tokens,
    :modalities,
    :model,
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
      input_audio_format: {:enum, ["pcm16", "g711_ulaw", "g711_alaw"]},
      input_audio_transcription: {OpenAI.RealtimeSessionCreateRequestInputAudioTranscription, :t},
      instructions: :string,
      max_response_output_tokens: {:union, [:integer, const: "inf"]},
      modalities: :map,
      model:
        {:enum,
         [
           "gpt-4o-realtime-preview",
           "gpt-4o-realtime-preview-2024-10-01",
           "gpt-4o-realtime-preview-2024-12-17",
           "gpt-4o-mini-realtime-preview",
           "gpt-4o-mini-realtime-preview-2024-12-17"
         ]},
      output_audio_format: {:enum, ["pcm16", "g711_ulaw", "g711_alaw"]},
      temperature: :number,
      tool_choice: :string,
      tools: [{OpenAI.RealtimeSessionCreateRequestTools, :t}],
      turn_detection: {OpenAI.RealtimeSessionCreateRequestTurnDetection, :t},
      voice: {:enum, ["alloy", "ash", "ballad", "coral", "echo", "sage", "shimmer", "verse"]}
    ]
  end
end
