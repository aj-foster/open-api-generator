defmodule MultiSearchSearchesParameter do
  @moduledoc """
  Provides struct and type for a MultiSearchSearchesParameter
  """

  @type t :: %__MODULE__{searches: [MultiSearchCollectionParameters.t()]}

  defstruct [:searches]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [searches: [{MultiSearchCollectionParameters, :t}]]
  end
end
