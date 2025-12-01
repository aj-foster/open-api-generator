defmodule OpenAI.ModifyAssistantRequestToolResources do
  @moduledoc """
  Provides struct and type for a ModifyAssistantRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAI.ModifyAssistantRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAI.ModifyAssistantRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.ModifyAssistantRequestToolResourcesCodeInterpreter, :t},
      file_search: {OpenAI.ModifyAssistantRequestToolResourcesFileSearch, :t}
    ]
  end
end
