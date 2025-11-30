defmodule OpenAI.SubmitToolOutputsRunRequestToolOutputs do
  @moduledoc """
  Provides struct and type for a SubmitToolOutputsRunRequestToolOutputs
  """

  @type t :: %__MODULE__{output: String.t() | nil, tool_call_id: String.t() | nil}

  defstruct [:output, :tool_call_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [output: :string, tool_call_id: :string]
  end
end
