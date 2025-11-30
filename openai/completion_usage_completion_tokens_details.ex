defmodule OpenAI.CompletionUsageCompletionTokensDetails do
  @moduledoc """
  Provides struct and type for a CompletionUsageCompletionTokensDetails
  """

  @type t :: %__MODULE__{
          accepted_prediction_tokens: integer | nil,
          audio_tokens: integer | nil,
          reasoning_tokens: integer | nil,
          rejected_prediction_tokens: integer | nil
        }

  defstruct [
    :accepted_prediction_tokens,
    :audio_tokens,
    :reasoning_tokens,
    :rejected_prediction_tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accepted_prediction_tokens: :integer,
      audio_tokens: :integer,
      reasoning_tokens: :integer,
      rejected_prediction_tokens: :integer
    ]
  end
end
