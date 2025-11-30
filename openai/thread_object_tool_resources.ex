defmodule OpenAI.ThreadObjectToolResources do
  @moduledoc """
  Provides struct and type for a ThreadObjectToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAI.ThreadObjectToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAI.ThreadObjectToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.ThreadObjectToolResourcesCodeInterpreter, :t},
      file_search: {OpenAI.ThreadObjectToolResourcesFileSearch, :t}
    ]
  end
end
