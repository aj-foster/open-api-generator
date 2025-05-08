defmodule RunStepDetailsToolCallsFileSearchObjectFileSearch do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFileSearchObjectFileSearch
  """

  @type t :: %__MODULE__{
          ranking_options: RunStepDetailsToolCallsFileSearchRankingOptionsObject.t() | nil,
          results: [RunStepDetailsToolCallsFileSearchResultObject.t()] | nil
        }

  defstruct [:ranking_options, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ranking_options: {RunStepDetailsToolCallsFileSearchRankingOptionsObject, :t},
      results: [{RunStepDetailsToolCallsFileSearchResultObject, :t}]
    ]
  end
end
