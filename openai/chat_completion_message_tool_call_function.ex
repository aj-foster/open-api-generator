defmodule OpenAI.ChatCompletionMessageToolCallFunction do
  @moduledoc """
  Provides struct and type for a ChatCompletionMessageToolCallFunction
  """

  @type t :: %__MODULE__{arguments: String.t(), name: String.t()}

  defstruct [:arguments, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [arguments: :string, name: :string]
  end
end
