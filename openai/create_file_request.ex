defmodule OpenAI.CreateFileRequest do
  @moduledoc """
  Provides struct and type for a CreateFileRequest
  """

  @type t :: %__MODULE__{file: binary, purpose: String.t()}

  defstruct [:file, :purpose]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      file: {:string, "binary"},
      purpose: {:enum, ["assistants", "batch", "fine-tune", "vision", "user_data", "evals"]}
    ]
  end
end
