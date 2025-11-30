defmodule OpenAI.CreateChatCompletionResponseChoicesLogprobs do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionResponseChoicesLogprobs
  """

  @type t :: %__MODULE__{
          content: [OpenAI.ChatCompletionTokenLogprob.t()] | nil,
          refusal: [OpenAI.ChatCompletionTokenLogprob.t()] | nil
        }

  defstruct [:content, :refusal]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [{OpenAI.ChatCompletionTokenLogprob, :t}],
      refusal: [{OpenAI.ChatCompletionTokenLogprob, :t}]
    ]
  end
end
