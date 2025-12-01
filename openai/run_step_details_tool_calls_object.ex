defmodule OpenAI.RunStepDetailsToolCallsObject do
  @moduledoc """
  Provides struct and type for a RunStepDetailsToolCallsObject
  """

  @type t :: %__MODULE__{
          tool_calls: [
            OpenAI.RunStepDetailsToolCallsCodeObject.t()
            | OpenAI.RunStepDetailsToolCallsFileSearchObject.t()
            | OpenAI.RunStepDetailsToolCallsFunctionObject.t()
          ],
          type: String.t()
        }

  defstruct [:tool_calls, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      tool_calls: [
        union: [
          {OpenAI.RunStepDetailsToolCallsCodeObject, :t},
          {OpenAI.RunStepDetailsToolCallsFileSearchObject, :t},
          {OpenAI.RunStepDetailsToolCallsFunctionObject, :t}
        ]
      ],
      type: {:const, "tool_calls"}
    ]
  end
end
