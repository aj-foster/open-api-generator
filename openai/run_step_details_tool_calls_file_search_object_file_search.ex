defmodule OpenAI.RunStepDetailsToolCallsFileSearchObjectFileSearch do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFileSearchObjectFileSearch
  """

  @type t :: %__MODULE__{
          ranking_options: OpenAI.RunStepDetailsToolCallsFileSearchRankingOptionsObject.t() | nil,
          results: [OpenAI.RunStepDetailsToolCallsFileSearchResultObject.t()] | nil
        }

  defstruct [:ranking_options, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ranking_options: {OpenAI.RunStepDetailsToolCallsFileSearchRankingOptionsObject, :t},
      results: [{OpenAI.RunStepDetailsToolCallsFileSearchResultObject, :t}]
    ]
  end
end
