defmodule GitHub.Actions.Workflow.RunUsageBillable do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.RunUsageBillable
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          MACOS: GitHub.Actions.Workflow.RunUsageBillableMACOS.t() | nil,
          UBUNTU: GitHub.Actions.Workflow.RunUsageBillableUBUNTU.t() | nil,
          WINDOWS: GitHub.Actions.Workflow.RunUsageBillableWINDOWS.t() | nil,
          __info__: map
        }

  defstruct [:MACOS, :UBUNTU, :WINDOWS, :__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MACOS: {GitHub.Actions.Workflow.RunUsageBillableMACOS, :t},
      UBUNTU: {GitHub.Actions.Workflow.RunUsageBillableUBUNTU, :t},
      WINDOWS: {GitHub.Actions.Workflow.RunUsageBillableWINDOWS, :t}
    ]
  end
end
