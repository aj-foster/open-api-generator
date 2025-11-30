defmodule OpenAI.FileSearchToolCall do
  @moduledoc """
  Provides struct and type for a FileSearchToolCall
  """

  @type t :: %__MODULE__{
          id: String.t(),
          queries: [String.t()],
          results: [OpenAI.FileSearchToolCallResults.t()] | nil,
          status: String.t(),
          type: String.t()
        }

  defstruct [:id, :queries, :results, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: :string,
      queries: [:string],
      results: [{OpenAI.FileSearchToolCallResults, :t}],
      status: {:enum, ["in_progress", "searching", "completed", "incomplete", "failed"]},
      type: {:const, "file_search_call"}
    ]
  end
end
