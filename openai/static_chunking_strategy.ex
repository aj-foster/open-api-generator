defmodule OpenAI.StaticChunkingStrategy do
  @moduledoc """
  Provides struct and type for a StaticChunkingStrategy
  """

  @type t :: %__MODULE__{chunk_overlap_tokens: integer, max_chunk_size_tokens: integer}

  defstruct [:chunk_overlap_tokens, :max_chunk_size_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [chunk_overlap_tokens: :integer, max_chunk_size_tokens: :integer]
  end
end
