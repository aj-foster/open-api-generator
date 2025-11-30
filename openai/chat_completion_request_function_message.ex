defmodule OpenAI.ChatCompletionRequestFunctionMessage do
  @moduledoc """
  Provides struct and type for a ChatCompletionRequestFunctionMessage
  """

  @type t :: %__MODULE__{content: String.t() | nil, name: String.t(), role: String.t()}

  defstruct [:content, :name, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: :string, name: :string, role: {:const, "function"}]
  end
end
