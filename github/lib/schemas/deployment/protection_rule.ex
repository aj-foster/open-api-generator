defmodule GitHub.Deployment.ProtectionRule do
  @moduledoc """
  Provides struct and type for a Deployment.ProtectionRule
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          app: GitHub.CustomDeploymentRuleApp.t(),
          enabled: boolean,
          id: integer,
          node_id: String.t()
        }

  defstruct [:__info__, :app, :enabled, :id, :node_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {GitHub.CustomDeploymentRuleApp, :t},
      enabled: :boolean,
      id: :integer,
      node_id: {:string, :generic}
    ]
  end
end
