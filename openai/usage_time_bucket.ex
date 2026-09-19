defmodule OpenAI.UsageTimeBucket do
  @moduledoc """
  Provides struct and type for a UsageTimeBucket
  """

  @type t :: %__MODULE__{
          end_time: integer,
          object: String.t(),
          result: [
            OpenAI.CostsResult.t()
            | OpenAI.UsageAudioSpeechesResult.t()
            | OpenAI.UsageAudioTranscriptionsResult.t()
            | OpenAI.UsageCodeInterpreterSessionsResult.t()
            | OpenAI.UsageCompletionsResult.t()
            | OpenAI.UsageEmbeddingsResult.t()
            | OpenAI.UsageImagesResult.t()
            | OpenAI.UsageModerationsResult.t()
            | OpenAI.UsageVectorStoresResult.t()
          ],
          start_time: integer
        }

  defstruct [:end_time, :object, :result, :start_time]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_time: :integer,
      object: {:const, "bucket"},
      result: [
        union: [
          {OpenAI.CostsResult, :t},
          {OpenAI.UsageAudioSpeechesResult, :t},
          {OpenAI.UsageAudioTranscriptionsResult, :t},
          {OpenAI.UsageCodeInterpreterSessionsResult, :t},
          {OpenAI.UsageCompletionsResult, :t},
          {OpenAI.UsageEmbeddingsResult, :t},
          {OpenAI.UsageImagesResult, :t},
          {OpenAI.UsageModerationsResult, :t},
          {OpenAI.UsageVectorStoresResult, :t}
        ]
      ],
      start_time: :integer
    ]
  end
end
