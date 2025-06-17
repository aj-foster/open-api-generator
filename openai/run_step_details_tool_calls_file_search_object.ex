defmodule RunStepDetailsToolCallsFileSearchObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsFileSearchObject
  """

  @type t :: %__MODULE__{
          file_search: RunStepDetailsToolCallsFileSearchObjectFileSearch.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:file_search, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file_search: {RunStepDetailsToolCallsFileSearchObjectFileSearch, :t},
      id: {:string, :generic},
      type: {:const, "file_search"}
    ]
  end
end
