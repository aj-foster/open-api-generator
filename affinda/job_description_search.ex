defmodule Affinda.JobDescriptionSearch do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearch
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          next: String.t() | nil,
          parameters: Affinda.JobDescriptionSearchParameters.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.JobDescriptionSearchResult.t()] | nil
        }

  defstruct [:count, :next, :parameters, :previous, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      next: :string,
      parameters: {Affinda.JobDescriptionSearchParameters, :t},
      previous: :string,
      results: [{Affinda.JobDescriptionSearchResult, :t}]
    ]
  end
end
