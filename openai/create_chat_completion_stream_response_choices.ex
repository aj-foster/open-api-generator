defmodule OpenAI.CreateChatCompletionStreamResponseChoices do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionStreamResponseChoices
  """

  @type t :: %__MODULE__{
          delta: OpenAI.ChatCompletionStreamResponseDelta.t(),
          finish_reason: String.t() | nil,
          index: integer,
          logprobs: OpenAI.CreateChatCompletionStreamResponseChoicesLogprobs.t() | nil
        }

  defstruct [:delta, :finish_reason, :index, :logprobs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: {OpenAI.ChatCompletionStreamResponseDelta, :t},
      finish_reason: {:enum, ["stop", "length", "tool_calls", "content_filter", "function_call"]},
      index: :integer,
      logprobs: {OpenAI.CreateChatCompletionStreamResponseChoicesLogprobs, :t}
    ]
  end
end
