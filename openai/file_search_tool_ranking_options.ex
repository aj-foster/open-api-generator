defmodule OpenAI.FileSearchToolRankingOptions do
  @moduledoc """
  Provides struct and type for a FileSearchToolRankingOptions
  """

  @type t :: %__MODULE__{ranker: String.t() | nil, score_threshold: number | nil}

  defstruct [:ranker, :score_threshold]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [ranker: {:enum, ["auto", "default-2024-11-15"]}, score_threshold: :number]
  end
end
