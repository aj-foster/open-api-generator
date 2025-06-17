defmodule UsageTimeBucket do
  @moduledoc """
  Provides struct and type for a UsageTimeBucket
  """

  @type t :: %__MODULE__{
          end_time: integer,
          object: String.t(),
          result: [
            CostsResult.t()
            | UsageAudioSpeechesResult.t()
            | UsageAudioTranscriptionsResult.t()
            | UsageCodeInterpreterSessionsResult.t()
            | UsageCompletionsResult.t()
            | UsageEmbeddingsResult.t()
            | UsageImagesResult.t()
            | UsageModerationsResult.t()
            | UsageVectorStoresResult.t()
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
          {CostsResult, :t},
          {UsageAudioSpeechesResult, :t},
          {UsageAudioTranscriptionsResult, :t},
          {UsageCodeInterpreterSessionsResult, :t},
          {UsageCompletionsResult, :t},
          {UsageEmbeddingsResult, :t},
          {UsageImagesResult, :t},
          {UsageModerationsResult, :t},
          {UsageVectorStoresResult, :t}
        ]
      ],
      start_time: :integer
    ]
  end
end
