defmodule OpenAI.CodeInterpreterFileOutput do
  @moduledoc """
  Provides struct and type for a CodeInterpreterFileOutput
  """

  @type t :: %__MODULE__{files: [OpenAI.CodeInterpreterFileOutputFiles.t()], type: String.t()}

  defstruct [:files, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: [{OpenAI.CodeInterpreterFileOutputFiles, :t}], type: {:const, "files"}]
  end
end
