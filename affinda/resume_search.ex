defmodule ResumeSearch do
  @moduledoc """
  Provides struct and type for a ResumeSearch
  """

  @type t :: %__MODULE__{
          count: integer | nil,
          next: String.t() | nil,
          parameters: ResumeSearchParameters.t() | nil,
          previous: String.t() | nil,
          results: [ResumeSearchResult.t()] | nil
        }

  defstruct [:count, :next, :parameters, :previous, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      count: :integer,
      next: {:string, :generic},
      parameters: {ResumeSearchParameters, :t},
      previous: {:string, :generic},
      results: [{ResumeSearchResult, :t}]
    ]
  end
end
