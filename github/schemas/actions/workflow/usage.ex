defmodule GitHub.Actions.Workflow.Usage do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.Usage
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, billable: GitHub.Actions.Workflow.UsageBillable.t()}

  defstruct [:__info__, :billable]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [billable: {GitHub.Actions.Workflow.UsageBillable, :t}]
  end
end
