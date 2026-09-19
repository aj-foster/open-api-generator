defmodule OpenAI.SubmitToolOutputsRunRequest do
  @moduledoc """
  Provides struct and type for a SubmitToolOutputsRunRequest
  """

  @type t :: %__MODULE__{
          stream: boolean | nil,
          tool_outputs: [OpenAI.SubmitToolOutputsRunRequestToolOutputs.t()]
        }

  defstruct [:stream, :tool_outputs]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [stream: :boolean, tool_outputs: [{OpenAI.SubmitToolOutputsRunRequestToolOutputs, :t}]]
  end
end
