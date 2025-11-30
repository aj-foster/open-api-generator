defmodule OpenAI.ChatCompletionStreamResponseDelta do
  @moduledoc """
  Provides struct and type for a ChatCompletionStreamResponseDelta
  """

  @type t :: %__MODULE__{
          content: String.t() | nil,
          function_call: OpenAI.ChatCompletionStreamResponseDeltaFunctionCall.t() | nil,
          refusal: String.t() | nil,
          role: String.t() | nil,
          tool_calls: [OpenAI.ChatCompletionMessageToolCallChunk.t()] | nil
        }

  defstruct [:content, :function_call, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:string, :generic},
      function_call: {OpenAI.ChatCompletionStreamResponseDeltaFunctionCall, :t},
      refusal: {:string, :generic},
      role: {:enum, ["developer", "system", "user", "assistant", "tool"]},
      tool_calls: [{OpenAI.ChatCompletionMessageToolCallChunk, :t}]
    ]
  end
end
