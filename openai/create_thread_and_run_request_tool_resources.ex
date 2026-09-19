defmodule OpenAI.CreateThreadAndRunRequestToolResources do
  @moduledoc """
  Provides struct and type for a CreateThreadAndRunRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter:
            OpenAI.CreateThreadAndRunRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAI.CreateThreadAndRunRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.CreateThreadAndRunRequestToolResourcesCodeInterpreter, :t},
      file_search: {OpenAI.CreateThreadAndRunRequestToolResourcesFileSearch, :t}
    ]
  end
end
