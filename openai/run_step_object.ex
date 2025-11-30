defmodule OpenAI.RunStepObject do
  @moduledoc """
  Provides struct and type for a RunStepObject
  """

  @type t :: %__MODULE__{
          assistant_id: String.t(),
          cancelled_at: integer | nil,
          completed_at: integer | nil,
          created_at: integer,
          expired_at: integer | nil,
          failed_at: integer | nil,
          id: String.t(),
          last_error: OpenAI.RunStepObjectLastError.t() | nil,
          metadata: map,
          object: String.t(),
          run_id: String.t(),
          status: String.t(),
          step_details:
            OpenAI.RunStepDetailsMessageCreationObject.t()
            | OpenAI.RunStepDetailsToolCallsObject.t(),
          thread_id: String.t(),
          type: String.t(),
          usage: OpenAI.RunStepCompletionUsage.t()
        }

  defstruct [
    :assistant_id,
    :cancelled_at,
    :completed_at,
    :created_at,
    :expired_at,
    :failed_at,
    :id,
    :last_error,
    :metadata,
    :object,
    :run_id,
    :status,
    :step_details,
    :thread_id,
    :type,
    :usage
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      assistant_id: {:string, :generic},
      cancelled_at: :integer,
      completed_at: :integer,
      created_at: :integer,
      expired_at: :integer,
      failed_at: :integer,
      id: {:string, :generic},
      last_error: {OpenAI.RunStepObjectLastError, :t},
      metadata: :map,
      object: {:const, "thread.run.step"},
      run_id: {:string, :generic},
      status: {:enum, ["in_progress", "cancelled", "failed", "completed", "expired"]},
      step_details:
        {:union,
         [
           {OpenAI.RunStepDetailsMessageCreationObject, :t},
           {OpenAI.RunStepDetailsToolCallsObject, :t}
         ]},
      thread_id: {:string, :generic},
      type: {:enum, ["message_creation", "tool_calls"]},
      usage: {OpenAI.RunStepCompletionUsage, :t}
    ]
  end
end
