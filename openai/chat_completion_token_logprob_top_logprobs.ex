defmodule OpenAI.ChatCompletionTokenLogprobTopLogprobs do
  @moduledoc """
  Provides struct and type for a ChatCompletionTokenLogprobTopLogprobs
  """

  @type t :: %__MODULE__{bytes: [integer] | nil, logprob: number, token: String.t()}

  defstruct [:bytes, :logprob, :token]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bytes: [:integer], logprob: :number, token: :string]
  end
end
