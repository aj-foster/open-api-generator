defmodule OpenAI.CreateUploadRequest do
  @moduledoc """
  Provides struct and type for a CreateUploadRequest
  """

  @type t :: %__MODULE__{
          bytes: integer,
          filename: String.t(),
          mime_type: String.t(),
          purpose: String.t()
        }

  defstruct [:bytes, :filename, :mime_type, :purpose]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      bytes: :integer,
      filename: :string,
      mime_type: :string,
      purpose: {:enum, ["assistants", "batch", "fine-tune", "vision"]}
    ]
  end
end
