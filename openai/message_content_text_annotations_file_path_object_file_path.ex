defmodule OpenAI.MessageContentTextAnnotationsFilePathObjectFilePath do
  @moduledoc """
  Provides struct and type for a MessageContentTextAnnotationsFilePathObjectFilePath
  """

  @type t :: %__MODULE__{file_id: String.t()}

  defstruct [:file_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_id: :string]
  end
end
