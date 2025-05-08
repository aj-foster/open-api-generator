defmodule GitHub.SearchResultTextMatchesMatches do
  @moduledoc """
  Provides struct and type for a SearchResultTextMatchesMatches
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, indices: [integer] | nil, text: String.t() | nil}

  defstruct [:__info__, :indices, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [indices: [:integer], text: {:string, :generic}]
  end
end
