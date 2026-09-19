defmodule OpenAI.ChatCompletionResponseMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionResponseMessage
  """

  @type t :: %__MODULE__{
          annotations: [map] | nil,
          audio: map | nil,
          content: String.t() | nil,
          function_call: map | nil,
          refusal: String.t() | nil,
          role: String.t(),
          tool_calls: [OpenAI.ChatCompletionMessageToolCall.t()] | nil
        }

  defstruct [:annotations, :audio, :content, :function_call, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [:map],
      audio: :map,
      content: :string,
      function_call: :map,
      refusal: :string,
      role: {:const, "assistant"},
      tool_calls: [{OpenAI.ChatCompletionMessageToolCall, :t}]
    ]
  end
end
