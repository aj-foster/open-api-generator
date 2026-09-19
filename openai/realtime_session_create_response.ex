defmodule OpenAI.RealtimeSessionCreateResponse do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateResponse
  """

  @type t :: %__MODULE__{
          client_secret: OpenAI.RealtimeSessionCreateResponseClientSecret.t(),
          input_audio_format: String.t() | nil,
          input_audio_transcription:
            OpenAI.RealtimeSessionCreateResponseInputAudioTranscription.t() | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: integer | String.t() | nil,
          modalities: map | nil,
          output_audio_format: String.t() | nil,
          temperature: number | nil,
          tool_choice: String.t() | nil,
          tools: [OpenAI.RealtimeSessionCreateResponseTools.t()] | nil,
          turn_detection: OpenAI.RealtimeSessionCreateResponseTurnDetection.t() | nil,
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
      client_secret: {OpenAI.RealtimeSessionCreateResponseClientSecret, :t},
      input_audio_format: :string,
      input_audio_transcription:
        {OpenAI.RealtimeSessionCreateResponseInputAudioTranscription, :t},
      instructions: :string,
      max_response_output_tokens: {:union, [:integer, const: "inf"]},
      modalities: :map,
      output_audio_format: :string,
      temperature: :number,
      tool_choice: :string,
      tools: [{OpenAI.RealtimeSessionCreateResponseTools, :t}],
      turn_detection: {OpenAI.RealtimeSessionCreateResponseTurnDetection, :t},
      voice: {:enum, ["alloy", "ash", "ballad", "coral", "echo", "sage", "shimmer", "verse"]}
    ]
  end
end
