defmodule OpenAI.MessageContentImageFileObject do
  @moduledoc """
  Provides struct and type for a MessageContentImageFileObject
  """

  @type t :: %__MODULE__{
          image_file: OpenAI.MessageContentImageFileObjectImageFile.t(),
          type: String.t()
        }

  defstruct [:image_file, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      image_file: {OpenAI.MessageContentImageFileObjectImageFile, :t},
      type: {:const, "image_file"}
    ]
  end
end
