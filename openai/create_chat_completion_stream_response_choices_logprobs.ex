defmodule CreateChatCompletionStreamResponseChoicesLogprobs do
  @moduledoc """
  Provides struct and type for a CreateChatCompletionStreamResponseChoicesLogprobs
  """

  @type t :: %__MODULE__{
          content: [ChatCompletionTokenLogprob.t()] | nil,
          refusal: [ChatCompletionTokenLogprob.t()] | nil
        }

  defstruct [:content, :refusal]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: [{ChatCompletionTokenLogprob, :t}], refusal: [{ChatCompletionTokenLogprob, :t}]]
  end
end
