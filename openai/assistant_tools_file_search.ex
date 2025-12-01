defmodule OpenAI.AssistantToolsFileSearch do
  @moduledoc """
  Provides struct and type for a AssistantToolsFileSearch
  """

  @type t :: %__MODULE__{
          file_search: OpenAI.AssistantToolsFileSearchFileSearch.t() | nil,
          type: String.t()
        }

  defstruct [:file_search, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_search: {OpenAI.AssistantToolsFileSearchFileSearch, :t}, type: {:const, "file_search"}]
  end
end
