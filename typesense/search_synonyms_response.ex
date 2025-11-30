defmodule Typesense.SearchSynonymsResponse do
  @moduledoc """
  Provides struct and type for a SearchSynonymsResponse
  """

  @type t :: %__MODULE__{synonyms: [Typesense.SearchSynonym.t()]}

  defstruct [:synonyms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [synonyms: [{Typesense.SearchSynonym, :t}]]
  end
end
