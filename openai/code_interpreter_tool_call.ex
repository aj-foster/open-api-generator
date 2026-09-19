defmodule OpenAI.CodeInterpreterToolCall do
  @moduledoc """
  Provides struct and type for a CodeInterpreterToolCall
  """

  @type t :: %__MODULE__{
          code: String.t(),
          id: String.t(),
          results: [OpenAI.CodeInterpreterFileOutput.t() | OpenAI.CodeInterpreterTextOutput.t()],
          status: String.t(),
          type: String.t()
        }

  defstruct [:code, :id, :results, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: :string,
      id: :string,
      results: [
        union: [{OpenAI.CodeInterpreterFileOutput, :t}, {OpenAI.CodeInterpreterTextOutput, :t}]
      ],
      status: {:enum, ["in_progress", "interpreting", "completed"]},
      type: {:const, "code_interpreter_call"}
    ]
  end
end
