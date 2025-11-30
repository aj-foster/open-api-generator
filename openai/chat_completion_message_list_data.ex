defmodule OpenAI.ChatCompletionMessageListData do
  @moduledoc """
  Provides struct and type for a ChatCompletionMessageListData
  """

  @type t :: %__MODULE__{
          annotations: [map] | nil,
          audio: map | nil,
          content: String.t() | nil,
          function_call: map | nil,
          id: String.t() | nil,
          refusal: String.t() | nil,
          role: String.t() | nil,
          tool_calls: [OpenAI.ChatCompletionMessageToolCall.t()] | nil
        }

  defstruct [:annotations, :audio, :content, :function_call, :id, :refusal, :role, :tool_calls]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      annotations: [:map],
      audio: :map,
      content: :string,
      function_call: :map,
      id: :string,
      refusal: :string,
      role: {:const, "assistant"},
      tool_calls: [{OpenAI.ChatCompletionMessageToolCall, :t}]
    ]
  end
end
