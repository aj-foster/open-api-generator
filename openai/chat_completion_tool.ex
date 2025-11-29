defmodule ChatCompletionTool do
  @moduledoc """
  Provides struct and type for a ChatCompletionTool
  """

  @type t :: %__MODULE__{function: FunctionObject.t(), type: String.t()}

  defstruct [:function, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [function: {FunctionObject, :t}, type: {:const, "function"}]
  end
end
