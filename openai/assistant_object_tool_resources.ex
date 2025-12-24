defmodule OpenAI.AssistantObjectToolResources do
  @moduledoc """
  Provides struct and type for a AssistantObjectToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAI.AssistantObjectToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAI.AssistantObjectToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.AssistantObjectToolResourcesCodeInterpreter, :t},
      file_search: {OpenAI.AssistantObjectToolResourcesFileSearch, :t}
    ]
  end
end
