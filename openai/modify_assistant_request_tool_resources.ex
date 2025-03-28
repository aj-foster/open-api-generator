defmodule ModifyAssistantRequestToolResources do
  @moduledoc """
  Provides struct and type for a ModifyAssistantRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: ModifyAssistantRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: ModifyAssistantRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {ModifyAssistantRequestToolResourcesCodeInterpreter, :t},
      file_search: {ModifyAssistantRequestToolResourcesFileSearch, :t}
    ]
  end
end
