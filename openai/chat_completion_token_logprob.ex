defmodule OpenAI.ChatCompletionTokenLogprob do
  @moduledoc """
  Provides struct and type for a ChatCompletionTokenLogprob
  """

  @type t :: %__MODULE__{
          bytes: [integer] | nil,
          logprob: number,
          token: String.t(),
          top_logprobs: [OpenAI.ChatCompletionTokenLogprobTopLogprobs.t()]
        }

  defstruct [:bytes, :logprob, :token, :top_logprobs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bytes: [:integer],
      logprob: :number,
      token: :string,
      top_logprobs: [{OpenAI.ChatCompletionTokenLogprobTopLogprobs, :t}]
    ]
  end
end
