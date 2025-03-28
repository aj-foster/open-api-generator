defmodule GitHub.Environment do
  @moduledoc """
  Provides struct and type for a Environment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          deployment_branch_policy: GitHub.Deployment.BranchPolicySettings.t() | nil,
          html_url: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          protection_rules: [GitHub.EnvironmentProtectionRules.t()] | nil,
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :deployment_branch_policy,
    :html_url,
    :id,
    :name,
    :node_id,
    :protection_rules,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      deployment_branch_policy: {:union, [{GitHub.Deployment.BranchPolicySettings, :t}, :null]},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      protection_rules: [{GitHub.EnvironmentProtectionRules, :t}],
      updated_at: {:string, :date_time},
      url: {:string, :generic}
    ]
  end
end
