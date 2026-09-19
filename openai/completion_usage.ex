defmodule OpenAI.CompletionUsage do
  @moduledoc """
  Provides struct and type for a CompletionUsage
  """

  @type t :: %__MODULE__{
          completion_tokens: integer,
          completion_tokens_details: OpenAI.CompletionUsageCompletionTokensDetails.t() | nil,
          prompt_tokens: integer,
          prompt_tokens_details: OpenAI.CompletionUsagePromptTokensDetails.t() | nil,
          total_tokens: integer
        }

  defstruct [
    :completion_tokens,
    :completion_tokens_details,
    :prompt_tokens,
    :prompt_tokens_details,
    :total_tokens
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      completion_tokens: :integer,
      completion_tokens_details: {OpenAI.CompletionUsageCompletionTokensDetails, :t},
      prompt_tokens: :integer,
      prompt_tokens_details: {OpenAI.CompletionUsagePromptTokensDetails, :t},
      total_tokens: :integer
    ]
  end
end
