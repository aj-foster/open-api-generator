defmodule Affinda.ResumeSearch do
  @moduledoc """
  Provides struct and type for a ResumeSearch
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          next: String.t() | nil,
          parameters: Affinda.ResumeSearchParameters.t() | nil,
          previous: String.t() | nil,
          results: [Affinda.ResumeSearchResult.t()] | nil
        }

  defstruct [:count, :next, :parameters, :previous, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      next: :string,
      parameters: {Affinda.ResumeSearchParameters, :t},
      previous: :string,
      results: [{Affinda.ResumeSearchResult, :t}]
    ]
  end
end
