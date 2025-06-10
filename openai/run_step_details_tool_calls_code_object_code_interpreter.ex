defmodule RunStepDetailsToolCallsCodeObjectCodeInterpreter do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsCodeObjectCodeInterpreter
  """

  @type t :: %__MODULE__{
          input: String.t(),
          outputs: [
            RunStepDetailsToolCallsCodeOutputImageObject.t()
            | RunStepDetailsToolCallsCodeOutputLogsObject.t()
          ]
        }

  defstruct [:input, :outputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input: {:string, :generic},
      outputs: [
        union: [
          {RunStepDetailsToolCallsCodeOutputImageObject, :t},
          {RunStepDetailsToolCallsCodeOutputLogsObject, :t}
        ]
      ]
    ]
  end
end
