defmodule ModifyThreadRequestToolResources do
  @moduledoc """
  Provides struct and type for a ModifyThreadRequestToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: ModifyThreadRequestToolResourcesCodeInterpreter.t() | nil,
          file_search: ModifyThreadRequestToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {ModifyThreadRequestToolResourcesCodeInterpreter, :t},
      file_search: {ModifyThreadRequestToolResourcesFileSearch, :t}
    ]
  end
end
