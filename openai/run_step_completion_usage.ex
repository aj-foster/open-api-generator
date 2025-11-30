defmodule OpenAI.RunStepCompletionUsage do
  @moduledoc """
  Provides struct and type for a RunStepCompletionUsage
  """

  @type t :: %__MODULE__{
          completion_tokens: integer,
          prompt_tokens: integer,
          total_tokens: integer
        }

  defstruct [:completion_tokens, :prompt_tokens, :total_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [completion_tokens: :integer, prompt_tokens: :integer, total_tokens: :integer]
  end
end
