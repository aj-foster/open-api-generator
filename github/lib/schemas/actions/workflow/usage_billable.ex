defmodule GitHub.Actions.Workflow.UsageBillable do
  @moduledoc """
  Provides struct and type for a Actions.Workflow.UsageBillable
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          MACOS: GitHub.Actions.Workflow.UsageBillableMACOS.t() | nil,
          UBUNTU: GitHub.Actions.Workflow.UsageBillableUBUNTU.t() | nil,
          WINDOWS: GitHub.Actions.Workflow.UsageBillableWINDOWS.t() | nil,
          __info__: map
        }

  defstruct [:MACOS, :UBUNTU, :WINDOWS, :__info__]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MACOS: {GitHub.Actions.Workflow.UsageBillableMACOS, :t},
      UBUNTU: {GitHub.Actions.Workflow.UsageBillableUBUNTU, :t},
      WINDOWS: {GitHub.Actions.Workflow.UsageBillableWINDOWS, :t}
    ]
  end
end
