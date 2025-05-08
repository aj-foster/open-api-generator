defmodule CreateThreadAndRunRequestToolResources do
  @moduledoc """
  Provides struct and type for a CreateThreadAndRunRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: CreateThreadAndRunRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: CreateThreadAndRunRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {CreateThreadAndRunRequestToolResourcesCodeInterpreter, :t},
      file_search: {CreateThreadAndRunRequestToolResourcesFileSearch, :t}
    ]
  end
end
