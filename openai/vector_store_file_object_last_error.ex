defmodule OpenAI.VectorStoreFileObjectLastError do
  @moduledoc """
  Provides struct and type for a VectorStoreFileObjectLastError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:enum, ["server_error", "unsupported_file", "invalid_file"]}, message: :string]
  end
end
