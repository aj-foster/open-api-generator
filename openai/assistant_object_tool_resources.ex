defmodule AssistantObjectToolResources do
  @moduledoc """
  Provides struct and type for a AssistantObjectToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: AssistantObjectToolResourcesCodeInterpreter.t() | nil,
          file_search: AssistantObjectToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {AssistantObjectToolResourcesCodeInterpreter, :t},
      file_search: {AssistantObjectToolResourcesFileSearch, :t}
    ]
  end
end
