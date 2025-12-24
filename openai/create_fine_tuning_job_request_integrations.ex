defmodule OpenAI.CreateFineTuningJobRequestIntegrations do
  @moduledoc """
  Provides struct and type for a CreateFineTuningJobRequestIntegrations
  """

  @type t :: %__MODULE__{
          type: String.t(),
          wandb: OpenAI.CreateFineTuningJobRequestIntegrationsWandb.t()
        }

  defstruct [:type, :wandb]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, "wandb"}, wandb: {OpenAI.CreateFineTuningJobRequestIntegrationsWandb, :t}]
  end
end
