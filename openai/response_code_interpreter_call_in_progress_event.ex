defmodule OpenAI.ResponseCodeInterpreterCallInProgressEvent do
  @moduledoc """
  Provides struct and type for a ResponseCodeInterpreterCallInProgressEvent
  """

  @type t :: %__MODULE__{
          code_interpreter_call: OpenAI.CodeInterpreterToolCall.t(),
          output_index: integer,
          type: String.t()
        }

  defstruct [:code_interpreter_call, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter_call: {OpenAI.CodeInterpreterToolCall, :t},
      output_index: :integer,
      type: {:const, "response.code_interpreter_call.in_progress"}
    ]
  end
end
