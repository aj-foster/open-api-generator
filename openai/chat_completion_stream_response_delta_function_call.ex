defmodule OpenAI.ChatCompletionStreamResponseDeltaFunctionCall do
  @moduledoc """
  Provides struct and type for a ChatCompletionStreamResponseDeltaFunctionCall
  """

  @type t :: %__MODULE__{arguments: String.t() | nil, name: String.t() | nil}

  defstruct [:arguments, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [arguments: :string, name: :string]
  end
end
