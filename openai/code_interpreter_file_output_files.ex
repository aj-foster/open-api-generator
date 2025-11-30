defmodule OpenAI.CodeInterpreterFileOutputFiles do
  @moduledoc """
  Provides struct and type for a CodeInterpreterFileOutputFiles
  """

  @type t :: %__MODULE__{file_id: String.t(), mime_type: String.t()}

  defstruct [:file_id, :mime_type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_id: :string, mime_type: :string]
  end
end
