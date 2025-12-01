defmodule OpenAI.CreateChatCompletionResponseChoices do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionResponseChoices
  """

  @type t :: %__MODULE__{
          finish_reason: String.t(),
          index: integer,
          logprobs: OpenAI.CreateChatCompletionResponseChoicesLogprobs.t() | nil,
          message: OpenAI.ChatCompletionResponseMessage.t()
        }

  defstruct [:finish_reason, :index, :logprobs, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      finish_reason: {:enum, ["stop", "length", "tool_calls", "content_filter", "function_call"]},
      index: :integer,
      logprobs: {OpenAI.CreateChatCompletionResponseChoicesLogprobs, :t},
      message: {OpenAI.ChatCompletionResponseMessage, :t}
    ]
  end
end
