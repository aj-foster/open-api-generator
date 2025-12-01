defmodule GitHub.Actions.Workflow.RunUsage do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.RunUsage
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          billable: GitHub.Actions.Workflow.RunUsageBillable.t(),
          run_duration_ms: integer | nil
        }

  defstruct [:__info__, :billable, :run_duration_ms]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable: {GitHub.Actions.Workflow.RunUsageBillable, :t}, run_duration_ms: :integer]
  end
end
