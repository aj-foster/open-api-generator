defmodule GitHub.Actions.Workflow.RunUsageBillableUBUNTUActions.JobRuns do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.RunUsageBillableUBUNTUActions.JobRuns
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, duration_ms: integer, job_id: integer}

  defstruct [:__info__, :duration_ms, :job_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [duration_ms: :integer, job_id: :integer]
  end
end
