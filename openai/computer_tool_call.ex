defmodule ComputerToolCall do
  @moduledoc """
  Provides struct and type for a ComputerToolCall
  """

  @type t :: %__MODULE__{
          action:
            Click.t()
            | DoubleClick.t()
            | Drag.t()
            | KeyPress.t()
            | Move.t()
            | Screenshot.t()
            | Scroll.t()
            | Type.t()
            | Wait.t(),
          call_id: String.t(),
          id: String.t(),
          pending_safety_checks: [ComputerToolCallSafetyCheck.t()],
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
           {Click, :t},
           {DoubleClick, :t},
           {Drag, :t},
           {KeyPress, :t},
           {Move, :t},
           {Screenshot, :t},
           {Scroll, :t},
           {Type, :t},
           {Wait, :t}
         ]},
      call_id: {:string, :generic},
      id: {:string, :generic},
      pending_safety_checks: [{ComputerToolCallSafetyCheck, :t}],
      status: {:enum, ["in_progress", "completed", "incomplete"]},
      type: {:const, "computer_call"}
    ]
  end
end
