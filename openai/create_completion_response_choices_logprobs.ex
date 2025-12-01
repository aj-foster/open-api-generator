defmodule OpenAI.CreateCompletionResponseChoicesLogprobs do
  @moduledoc """
  Provides struct and type for a CreateCompletionResponseChoicesLogprobs
  """

  @type t :: %__MODULE__{
          text_offset: [integer] | nil,
          token_logprobs: [number] | nil,
          tokens: [String.t()] | nil,
          top_logprobs: [map] | nil
        }

  defstruct [:text_offset, :token_logprobs, :tokens, :top_logprobs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text_offset: [:integer], token_logprobs: [:number], tokens: [:string], top_logprobs: [:map]]
  end
end
