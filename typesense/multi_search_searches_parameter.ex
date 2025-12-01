defmodule Typesense.MultiSearchSearchesParameter do
  @moduledoc """
  Provides struct and type for a MultiSearchSearchesParameter
  """

  @type t :: %__MODULE__{searches: [Typesense.MultiSearchCollectionParameters.t()]}

  defstruct [:searches]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [searches: [{Typesense.MultiSearchCollectionParameters, :t}]]
  end
end
