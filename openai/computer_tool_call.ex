defmodule OpenAI.ComputerToolCall do
  @moduledoc """
  Provides struct and type for a ComputerToolCall
  """

  @type t :: %__MODULE__{
          action:
            OpenAI.Click.t()
            | OpenAI.DoubleClick.t()
            | OpenAI.Drag.t()
            | OpenAI.KeyPress.t()
            | OpenAI.Move.t()
            | OpenAI.Screenshot.t()
            | OpenAI.Scroll.t()
            | OpenAI.Type.t()
            | OpenAI.Wait.t(),
          call_id: String.t(),
          id: String.t(),
          pending_safety_checks: [OpenAI.ComputerToolCallSafetyCheck.t()],
          status: String.t(),
          type: String.t()
        }

  defstruct [:action, :call_id, :id, :pending_safety_checks, :status, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action:
        {:union,
         [
           {OpenAI.Click, :t},
           {OpenAI.DoubleClick, :t},
           {OpenAI.Drag, :t},
           {OpenAI.KeyPress, :t},
           {OpenAI.Move, :t},
           {OpenAI.Screenshot, :t},
           {OpenAI.Scroll, :t},
           {OpenAI.Type, :t},
           {OpenAI.Wait, :t}
         ]},
      call_id: :string,
      id: :string,
      pending_safety_checks: [{OpenAI.ComputerToolCallSafetyCheck, :t}],
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "computer_call"}
    ]
  end
end
