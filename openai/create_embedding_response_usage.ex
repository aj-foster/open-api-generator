defmodule OpenAI.CreateEmbeddingResponseUsage do
  @moduledoc """
  Provides struct and type for a CreateEmbeddingResponseUsage
  """

  @type t :: %__MODULE__{prompt_tokens: integer, total_tokens: integer}

  defstruct [:prompt_tokens, :total_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [prompt_tokens: :integer, total_tokens: :integer]
  end
end
