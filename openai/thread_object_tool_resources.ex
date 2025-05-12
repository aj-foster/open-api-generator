defmodule ThreadObjectToolResources do
  @moduledoc """
  Provides struct and type for a ThreadObjectToolResources
  """

  @type t :: %__MODULE__{
          code_interpreter: ThreadObjectToolResourcesCodeInterpreter.t() | nil,
          file_search: ThreadObjectToolResourcesFileSearch.t() | nil
        }

  defstruct [:code_interpreter, :file_search]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {ThreadObjectToolResourcesCodeInterpreter, :t},
      file_search: {ThreadObjectToolResourcesFileSearch, :t}
    ]
  end
end
