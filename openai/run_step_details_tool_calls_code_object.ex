defmodule RunStepDetailsToolCallsCodeObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsCodeObject
  """

  @type t :: %__MODULE__{
          code_interpreter: RunStepDetailsToolCallsCodeObjectCodeInterpreter.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:code_interpreter, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code_interpreter: {RunStepDetailsToolCallsCodeObjectCodeInterpreter, :t},
      id: {:string, :generic},
      type: {:const, "code_interpreter"}
    ]
  end
end
