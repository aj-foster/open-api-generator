defmodule OpenAI.RunStepDetailsToolCallsFileSearchResultObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFileSearchResultObject
  """

  @type t :: %__MODULE__{
          content: [OpenAI.RunStepDetailsToolCallsFileSearchResultObjectContent.t()] | nil,
          file_id: String.t(),
          file_name: String.t(),
          score: number
        }

  defstruct [:content, :file_id, :file_name, :score]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: [{OpenAI.RunStepDetailsToolCallsFileSearchResultObjectContent, :t}],
      file_id: :string,
      file_name: :string,
      score: :number
    ]
  end
end
