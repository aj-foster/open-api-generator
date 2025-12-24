defmodule OpenAI.CreateCompletionResponseChoices do
  @moduledoc """
  Provides struct and type for a CreateCompletionResponseChoices
  """

  @type t :: %__MODULE__{
          finish_reason: String.t(),
          index: integer,
          logprobs: OpenAI.CreateCompletionResponseChoicesLogprobs.t() | nil,
          text: String.t()
        }

  defstruct [:finish_reason, :index, :logprobs, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      finish_reason: {:enum, ["stop", "length", "content_filter"]},
      index: :integer,
      logprobs: {OpenAI.CreateCompletionResponseChoicesLogprobs, :t},
      text: :string
    ]
  end
end
