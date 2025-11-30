defmodule OpenAI.ResponseCodeInterpreterCallCodeDeltaEvent do
  @moduledoc """
  Provides struct and type for a ResponseCodeInterpreterCallCodeDeltaEvent
  """

  @type t :: %__MODULE__{delta: String.t(), output_index: integer, type: String.t()}

  defstruct [:delta, :output_index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      delta: :string,
      output_index: :integer,
      type: {:const, "response.code_interpreter_call.code.delta"}
    ]
  end
end
