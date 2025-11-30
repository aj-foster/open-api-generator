defmodule OpenAI.MessageContentTextAnnotationsFilePathObject do
  @moduledoc """
  Provides struct and type for a MessageContentTextAnnotationsFilePathObject
  """

  @type t :: %__MODULE__{
          end_index: integer,
          file_path: OpenAI.MessageContentTextAnnotationsFilePathObjectFilePath.t(),
          start_index: integer,
          text: String.t(),
          type: String.t()
        }

  defstruct [:end_index, :file_path, :start_index, :text, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      end_index: :integer,
      file_path: {OpenAI.MessageContentTextAnnotationsFilePathObjectFilePath, :t},
      start_index: :integer,
      text: :string,
      type: {:const, "file_path"}
    ]
  end
end
