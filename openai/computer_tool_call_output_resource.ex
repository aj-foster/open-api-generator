defmodule OpenAI.ComputerToolCallOutputResource do
  @moduledoc """
  Provides struct and type for a ComputerToolCallOutputResource
  """

  @type t :: %__MODULE__{
          acknowledged_safety_checks: [OpenAI.ComputerToolCallSafetyCheck.t()] | nil,
          call_id: String.t() | nil,
          id: String.t() | nil,
          output: OpenAI.ComputerScreenshotImage.t() | nil,
          status: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:acknowledged_safety_checks, :call_id, :id, :output, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acknowledged_safety_checks: [{OpenAI.ComputerToolCallSafetyCheck, :t}],
      call_id: :string,
      id: :string,
      output: {OpenAI.ComputerScreenshotImage, :t},
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "computer_call_output"}
    ]
  end
end
