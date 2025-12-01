defmodule GitHub.Actions.Workflow.RunUsageBillableMACOS do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.RunUsageBillableMACOS
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          job_runs: [GitHub.Actions.Workflow.RunUsageBillableMACOSActions.JobRuns.t()] | nil,
          jobs: integer,
          total_ms: integer
        }

  defstruct [:__info__, :job_runs, :jobs, :total_ms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      job_runs: [{GitHub.Actions.Workflow.RunUsageBillableMACOSActions.JobRuns, :t}],
      jobs: :integer,
      total_ms: :integer
    ]
  end
end
