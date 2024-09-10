defmodule JobDescriptionSearch do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearch
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          next: String.t() | nil,
          parameters: JobDescriptionSearchParameters.t() | nil,
          previous: String.t() | nil,
          results: [JobDescriptionSearchResult.t()] | nil
        }

  defstruct [:count, :next, :parameters, :previous, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      next: {:string, :generic},
      parameters: {JobDescriptionSearchParameters, :t},
      previous: {:string, :generic},
      results: [{JobDescriptionSearchResult, :t}]
    ]
  end
end
