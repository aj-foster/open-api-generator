defmodule OpenAI.ChatCompletionMessageToolCallChunk do
  @moduledoc """
  Provides struct and type for a ChatCompletionMessageToolCallChunk
  """

  @type t :: %__MODULE__{
          function: OpenAI.ChatCompletionMessageToolCallChunkFunction.t() | nil,
          id: String.t() | nil,
          index: integer,
          type: String.t() | nil
        }

  defstruct [:function, :id, :index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {OpenAI.ChatCompletionMessageToolCallChunkFunction, :t},
      id: :string,
      index: :integer,
      type: {:const, "function"}
    ]
  end
end
