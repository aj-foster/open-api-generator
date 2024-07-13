defmodule MultiSearchResult do
  @moduledoc """
  Provides struct and type for a MultiSearchResult
  """

  @type t :: %__MODULE__{results: [SearchResult.t()]}

  defstruct [:results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [results: [{SearchResult, :t}]]
  end
end
