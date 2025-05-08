defmodule ChatCompletionMessageToolCall do
  @moduledoc """
  Provides struct and type for a ChatCompletionMessageToolCall
  """

  @type t :: %__MODULE__{
          function: ChatCompletionMessageToolCallFunction.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:function, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      function: {ChatCompletionMessageToolCallFunction, :t},
      id: {:string, :generic},
      type: {:const, "function"}
    ]
  end
end
