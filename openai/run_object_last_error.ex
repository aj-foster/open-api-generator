defmodule OpenAI.RunObjectLastError do
  @moduledoc """
  Provides struct and type for a RunObjectLastError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t()}

  defstruct [:code, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:enum, ["server_error", "rate_limit_exceeded", "invalid_prompt"]}, message: :string]
  end
end
