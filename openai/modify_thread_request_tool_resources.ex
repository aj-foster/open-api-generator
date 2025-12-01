defmodule OpenAI.ModifyThreadRequestToolResources do
  @moduledoc """
  Provides struct and type for a ModifyThreadRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: OpenAI.ModifyThreadRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: OpenAI.ModifyThreadRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {OpenAI.ModifyThreadRequestToolResourcesCodeInterpreter, :t},
      file_search: {OpenAI.ModifyThreadRequestToolResourcesFileSearch, :t}
    ]
  end
end
