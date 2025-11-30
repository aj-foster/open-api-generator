defmodule OpenAI.ChatCompletionRequestAssistantMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestAssistantMessage
  """

  @type t :: %__MODULE__{
          audio: OpenAI.ChatCompletionRequestAssistantMessageAudio.t() | nil,
          content: String.t() | [map] | nil,
          function_call: OpenAI.ChatCompletionRequestAssistantMessageFunctionCall.t() | nil,
          name: String.t() | nil,
          refusal: String.t() | nil,
          role: String.t(),
          tool_calls: [OpenAI.ChatCompletionMessageToolCall.t()] | nil
        }

  defstruct [:audio, :content, :function_call, :name, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio: {OpenAI.ChatCompletionRequestAssistantMessageAudio, :t},
      content: {:union, [:string, [:map]]},
      function_call: {OpenAI.ChatCompletionRequestAssistantMessageFunctionCall, :t},
      name: :string,
      refusal: :string,
      role: {:const, "assistant"},
      tool_calls: [{OpenAI.ChatCompletionMessageToolCall, :t}]
    ]
  end
end
