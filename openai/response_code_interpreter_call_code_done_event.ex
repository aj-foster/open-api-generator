defmodule OpenAI.ResponseCodeInterpreterCallCodeDoneEvent do
  @moduledoc """
  Provides struct and type for a ResponseCodeInterpreterCallCodeDoneEvent
  """

  @type t :: %__MODULE__{code: String.t(), output_index: integer, type: String.t()}

  defstruct [:code, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      output_index: :integer,
      type: {:const, "response.code_interpreter_call.code.done"}
    ]
  end
end
