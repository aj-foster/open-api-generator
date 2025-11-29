defmodule CreateChatCompletionResponseChoices do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionResponseChoices
  """

  @type t :: %__MODULE__{
          finish_reason: String.t(),
          index: integer,
          logprobs: CreateChatCompletionResponseChoicesLogprobs.t() | nil,
          message: ChatCompletionResponseMessage.t()
        }

  defstruct [:finish_reason, :index, :logprobs, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      finish_reason: {:enum, ["stop", "length", "tool_calls", "content_filter", "function_call"]},
      index: :integer,
      logprobs: {CreateChatCompletionResponseChoicesLogprobs, :t},
      message: {ChatCompletionResponseMessage, :t}
    ]
  end
end
