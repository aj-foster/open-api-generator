defmodule ChatCompletionRequestAssistantMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestAssistantMessage
  """

  @type t :: %__MODULE__{
          audio: ChatCompletionRequestAssistantMessageAudio.t() | nil,
          content: String.t() | [map] | nil,
          function_call: ChatCompletionRequestAssistantMessageFunctionCall.t() | nil,
          name: String.t() | nil,
          refusal: String.t() | nil,
          role: String.t(),
          tool_calls: [ChatCompletionMessageToolCall.t()] | nil
        }

  defstruct [:audio, :content, :function_call, :name, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      audio: {ChatCompletionRequestAssistantMessageAudio, :t},
      content: {:union, [{:string, :generic}, [:map]]},
      function_call: {ChatCompletionRequestAssistantMessageFunctionCall, :t},
      name: {:string, :generic},
      refusal: {:string, :generic},
      role: {:const, "assistant"},
      tool_calls: [{ChatCompletionMessageToolCall, :t}]
    ]
  end
end
