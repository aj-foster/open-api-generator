defmodule FineTuningIntegration do
  @moduledoc """
  Provides struct and type for a FineTuningIntegration
  """

  @type t :: %__MODULE__{type: String.t(), wandb: FineTuningIntegrationWandb.t()}

  defstruct [:type, :wandb]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "wandb"}, wandb: {FineTuningIntegrationWandb, :t}]
  end
end
