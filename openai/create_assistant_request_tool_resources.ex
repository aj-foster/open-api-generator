defmodule OpenAI.CreateAssistantRequestToolResources do
  @moduledoc """
  Provides struct and type for a CreateAssistantRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAI.CreateAssistantRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: map | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.CreateAssistantRequestToolResourcesCodeInterpreter, :t},
      file_search: :map
    ]
  end
end
