defmodule ChatCompletionNamedToolChoice do
  @moduledoc """
  Provides struct and type for a ChatCompletionNamedToolChoice
  """

  @type t :: %__MODULE__{function: ChatCompletionNamedToolChoiceFunction.t(), type: String.t()}

  defstruct [:function, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [function: {ChatCompletionNamedToolChoiceFunction, :t}, type: {:const, "function"}]
  end
end
